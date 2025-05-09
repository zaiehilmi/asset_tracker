create table public.maintenance_logs
(
    log_id      uuid default gen_random_uuid() not null
        primary key,
    item_id     uuid
        references public.items,
    date        timestamp,
    description text,
    cost        numeric
);

comment on table public.maintenance_logs is 'Rekod penyelenggaraan barang (e.g., servis aircond).';

alter table public.maintenance_logs
    owner to postgres;

create policy "CRUD access" on public.maintenance_logs
    as permissive
    for all
    to anon
    using true
with check true;

grant delete, insert, references, select, trigger, truncate, update on public.maintenance_logs to anon;

grant delete, insert, references, select, trigger, truncate, update on public.maintenance_logs to authenticated;

grant delete, insert, references, select, trigger, truncate, update on public.maintenance_logs to service_role;

