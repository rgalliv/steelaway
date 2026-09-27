create or replace function bid_intake_internal.workspace() returns jsonb language plpgsql security definer set search_path='' as $$
declare a public.profiles:=bid_intake_internal.actor();begin
 return jsonb_build_object('company_id',a.company_id,'company_name',(select name from public.companies where id=a.company_id),'bids',coalesce((select jsonb_agg(to_jsonb(b) order by created_at desc) from bid_intake_internal.bids b where company_id=a.company_id),'[]'),'sources',coalesce((select jsonb_agg(to_jsonb(s)-'extraction' order by created_at desc) from bid_intake_internal.sources s where company_id=a.company_id),'[]'),'byte_limit',(select byte_limit from bid_intake_internal.activation where company_id=a.company_id));
end $$;
create function bid_intake_internal.source(source_id uuid) returns jsonb language plpgsql security definer set search_path='' as $$
declare a public.profiles:=bid_intake_internal.actor();s bid_intake_internal.sources;begin
 select * into s from bid_intake_internal.sources where id=source_id and company_id=a.company_id;
 if not found then raise exception 'Source access denied' using errcode='42501';end if;
 return to_jsonb(s);
end $$;
revoke all on function bid_intake_internal.source(uuid) from public,anon;
grant execute on function bid_intake_internal.source(uuid) to authenticated;
create function public.bid_intake_source(p_id uuid) returns jsonb language sql security invoker set search_path='' as $$select bid_intake_internal.source(p_id)$$;
revoke all on function public.bid_intake_source(uuid) from public,anon;
grant execute on function public.bid_intake_source(uuid) to authenticated;
create index bid_intake_sources_company_created on bid_intake_internal.sources(company_id,created_at desc);
create index bid_intake_bids_company_created on bid_intake_internal.bids(company_id,created_at desc);
