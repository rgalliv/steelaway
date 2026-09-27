create schema bid_intake_internal;
revoke all on schema bid_intake_internal from public,anon;
create table bid_intake_internal.activation(company_id uuid primary key references public.companies(id),enabled boolean not null default false,byte_limit bigint not null default 1073741824 check(byte_limit>0));
create table bid_intake_internal.bids(id uuid primary key,company_id uuid not null references public.companies(id),name text not null,created_by uuid not null,created_at timestamptz not null default now());
create table bid_intake_internal.sources(id uuid primary key,bid_id uuid not null references bid_intake_internal.bids(id),company_id uuid not null,name text not null,category text not null,kind text not null check(kind in ('file','note')),sha256 text not null check(sha256 ~ '^[a-f0-9]{64}$'),byte_size bigint not null check(byte_size>=0 and byte_size<=52428800),object_path text unique,status text not null default 'uploading',extraction jsonb not null default '[]',extraction_note text not null default '',review_note text not null default '',revision integer not null default 0,created_by uuid not null,created_at timestamptz not null default now(),unique(bid_id,sha256));
create table bid_intake_internal.events(id bigint generated always as identity primary key,company_id uuid not null,source_id uuid,bid_id uuid not null,actor_id uuid not null,action text not null,detail jsonb not null default '{}',created_at timestamptz not null default now());
alter table bid_intake_internal.activation enable row level security;
alter table bid_intake_internal.bids enable row level security;
alter table bid_intake_internal.sources enable row level security;
alter table bid_intake_internal.events enable row level security;
revoke all on all tables in schema bid_intake_internal from public,anon,authenticated;
revoke all on all sequences in schema bid_intake_internal from public,anon,authenticated;
create function bid_intake_internal.actor() returns public.profiles language plpgsql security definer set search_path='' as $$
declare a public.profiles;begin
 if auth.uid() is null or coalesce((auth.jwt()->>'is_anonymous')::boolean,false) then raise exception 'Sign in to the company' using errcode='42501';end if;
 select * into a from public.profiles where id=auth.uid();
 if a.company_id is null or a.role::text not in ('admin','safety_director') or not exists(select 1 from bid_intake_internal.activation t where t.company_id=a.company_id and t.enabled) then raise exception 'Bid intake is not enabled for this company or role' using errcode='42501';end if;
 return a;
end $$;
create function bid_intake_internal.workspace() returns jsonb language plpgsql security definer set search_path='' as $$
declare a public.profiles:=bid_intake_internal.actor();begin
 return jsonb_build_object('company_id',a.company_id,'company_name',(select name from public.companies where id=a.company_id),'bids',coalesce((select jsonb_agg(to_jsonb(b) order by created_at desc) from bid_intake_internal.bids b where company_id=a.company_id),'[]'),'sources',coalesce((select jsonb_agg(to_jsonb(s) order by created_at desc) from bid_intake_internal.sources s where company_id=a.company_id),'[]'),'events',coalesce((select jsonb_agg(to_jsonb(e) order by created_at desc) from bid_intake_internal.events e where company_id=a.company_id),'[]'),'byte_limit',(select byte_limit from bid_intake_internal.activation where company_id=a.company_id));
end $$;
create function bid_intake_internal.command(action text,b jsonb) returns jsonb language plpgsql security definer set search_path='' as $$
declare a public.profiles:=bid_intake_internal.actor();j bid_intake_internal.bids;s bid_intake_internal.sources;sid uuid;bid uuid;bytes bigint;hash text;kind text;pages jsonb;begin
 if b is null or octet_length(b::text)>1000000 then raise exception 'Invalid or excessive request';end if;
 if action='create' then
  bid:=(b->>'id')::uuid;
  if bid is null or length(trim(coalesce(b->>'name',''))) not between 3 and 160 then raise exception 'A bid name is required';end if;
  select * into j from bid_intake_internal.bids where id=bid;
  if found then if j.company_id<>a.company_id or j.name<>trim(b->>'name') then raise exception 'Bid identity conflict' using errcode='42501';end if;return to_jsonb(j);end if;
  insert into bid_intake_internal.bids values(bid,a.company_id,trim(b->>'name'),a.id,now()) returning * into j;
  insert into bid_intake_internal.events(company_id,bid_id,actor_id,action) values(a.company_id,bid,a.id,'created');return to_jsonb(j);
 end if;
 if action in ('reserve','note') then
  bid:=(b->>'bid_id')::uuid;
  select * into j from bid_intake_internal.bids where id=bid and company_id=a.company_id;
  if not found then raise exception 'Bid access denied' using errcode='42501';end if;
  perform pg_catalog.pg_advisory_xact_lock(pg_catalog.hashtextextended(a.company_id::text,0));
  hash:=b->>'sha256';kind:=case when action='note' then 'note' else 'file' end;
  bytes:=(b->>'byte_size')::bigint;
  if hash is null or hash !~ '^[a-f0-9]{64}$' or bytes is null or bytes<0 or bytes>52428800 or length(trim(coalesce(b->>'name',''))) not between 1 and 220 or coalesce(b->>'category','') not in ('RFP','Drawings','Specifications','Addendum','Vendor quote','Estimate','Contract','Company reference','Other') then raise exception 'Invalid source';end if;
  select * into s from bid_intake_internal.sources where bid_id=bid and sha256=hash;
  if found then if s.kind<>kind or s.byte_size<>bytes then raise exception 'Source fingerprint conflict';end if;return to_jsonb(s);end if;
  if (select coalesce(sum(byte_size),0) from bid_intake_internal.sources where company_id=a.company_id)+bytes>(select byte_limit from bid_intake_internal.activation where company_id=a.company_id) then raise exception 'Company intake storage limit reached; contact the engineer';end if;
  sid:=(b->>'id')::uuid;if sid is null then raise exception 'Source ID required';end if;
  if kind='note' and length(coalesce(b->>'text','')) not between 1 and 250000 then raise exception 'Note must contain text';end if;
  insert into bid_intake_internal.sources(id,bid_id,company_id,name,category,kind,sha256,byte_size,object_path,status,extraction,created_by)
  values(sid,bid,a.company_id,trim(b->>'name'),b->>'category',kind,hash,bytes,case when kind='file' then a.company_id||'/'||bid||'/'||sid else null end,case when kind='note' then 'Needs review' else 'uploading' end,case when kind='note' then jsonb_build_array(jsonb_build_object('label','Pasted note','text',b->>'text')) else '[]'::jsonb end,a.id) returning * into s;
  insert into bid_intake_internal.events(company_id,bid_id,source_id,actor_id,action) values(a.company_id,bid,sid,a.id,case when kind='note' then 'note saved' else 'file registered' end);return to_jsonb(s);
 end if;
 select * into s from bid_intake_internal.sources where id=(b->>'id')::uuid and company_id=a.company_id for update;
 if not found then raise exception 'Source access denied' using errcode='42501';end if;
 if (b->>'expected_revision')::integer is distinct from s.revision then raise exception 'stale_revision: refresh this source';end if;
 if action='complete' then
  if s.kind<>'file' or s.status<>'uploading' then raise exception 'Source is already finalized';end if;
  if not exists(select 1 from storage.objects where bucket_id='sns-bid-intake' and name=s.object_path and (metadata->>'size')::bigint=s.byte_size) then raise exception 'Original upload is not confirmed';end if;
  pages:=b->'extraction';
  if pages is null or jsonb_typeof(pages)<>'array' or jsonb_array_length(pages)>200 or octet_length(pages::text)>750000 then raise exception 'Invalid extracted content';end if;
  if exists(select 1 from jsonb_array_elements(pages) x where jsonb_typeof(x)<>'object' or jsonb_typeof(x->'label') is distinct from 'string' or jsonb_typeof(x->'text') is distinct from 'string' or length(x->>'label')>100 or length(x->>'text')>250000) then raise exception 'Invalid source location';end if;
  update bid_intake_internal.sources set extraction=pages,extraction_note=left(coalesce(b->>'extraction_note',''),1000),status=case when jsonb_array_length(pages)>0 then 'Needs review' else 'Needs extraction' end,revision=revision+1 where id=s.id returning * into s;
 elsif action='review' then
  if s.status='uploading' or length(trim(coalesce(b->>'review_note',''))) not between 3 and 2000 then raise exception 'Record the review basis after upload';end if;
  update bid_intake_internal.sources set status='Reviewed source',review_note=trim(b->>'review_note'),revision=revision+1 where id=s.id returning * into s;
 else raise exception 'Unknown intake action';end if;
 insert into bid_intake_internal.events(company_id,bid_id,source_id,actor_id,action,detail) values(a.company_id,s.bid_id,s.id,a.id,action,jsonb_build_object('status',s.status,'revision',s.revision,'review_note',s.review_note));return to_jsonb(s);
end $$;
create function bid_intake_internal.object_allowed(path text,write_access boolean default false) returns boolean language plpgsql security definer set search_path='' as $$
declare a public.profiles;begin
 a:=bid_intake_internal.actor();return exists(select 1 from bid_intake_internal.sources s where company_id=a.company_id and object_path=path and (not write_access or status='uploading'));
exception when insufficient_privilege then return false;end $$;
revoke all on all functions in schema bid_intake_internal from public,anon,authenticated;
grant usage on schema bid_intake_internal to authenticated;
grant execute on function bid_intake_internal.workspace(),bid_intake_internal.command(text,jsonb),bid_intake_internal.object_allowed(text,boolean) to authenticated;
create function public.bid_intake_workspace() returns jsonb language sql security invoker set search_path='' as $$select bid_intake_internal.workspace()$$;
create function public.bid_intake_command(p_action text,p_body jsonb) returns jsonb language sql security invoker set search_path='' as $$select bid_intake_internal.command(p_action,p_body)$$;
revoke all on function public.bid_intake_workspace(),public.bid_intake_command(text,jsonb) from public,anon;
grant execute on function public.bid_intake_workspace(),public.bid_intake_command(text,jsonb) to authenticated;
insert into storage.buckets(id,name,public,file_size_limit) values('sns-bid-intake','sns-bid-intake',false,52428800);
create policy sns_bid_original_insert on storage.objects for insert to authenticated with check(bucket_id='sns-bid-intake' and bid_intake_internal.object_allowed(name,true));
create policy sns_bid_original_read on storage.objects for select to authenticated using(bucket_id='sns-bid-intake' and bid_intake_internal.object_allowed(name,false));
-- Restrictive guards also protect this bucket from unrelated pre-existing permissive policies.
create policy sns_bid_read_guard on storage.objects as restrictive for select to authenticated using(bucket_id<>'sns-bid-intake' or bid_intake_internal.object_allowed(name,false));
create policy sns_bid_insert_guard on storage.objects as restrictive for insert to authenticated with check(bucket_id<>'sns-bid-intake' or bid_intake_internal.object_allowed(name,true));
create policy sns_bid_update_guard on storage.objects as restrictive for update to authenticated using(bucket_id<>'sns-bid-intake') with check(bucket_id<>'sns-bid-intake');
create policy sns_bid_delete_guard on storage.objects as restrictive for delete to authenticated using(bucket_id<>'sns-bid-intake');
create policy sns_bid_anon_guard on storage.objects as restrictive for all to anon using(bucket_id<>'sns-bid-intake') with check(bucket_id<>'sns-bid-intake');
-- No UPDATE or DELETE policy: originals are immutable. Upload replacements as new sources.
