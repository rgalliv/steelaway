create or replace function bid_intake_internal.command(action text,b jsonb) returns jsonb language plpgsql security definer set search_path='' as $$
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
  if kind='file' and (bytes=0 or (b->>'name') !~* '\.(pdf|txt|md|csv|json|docx?|xlsx?|jpe?g|png|tiff?|eml|msg|zip|dwg|dxf)$') then raise exception 'Unsupported or empty original';end if;
  if kind='note' and bytes<>octet_length(coalesce(b->>'text','')) then raise exception 'Note byte size does not match its text';end if;
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
