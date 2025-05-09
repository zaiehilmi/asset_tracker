create table public.loans
(
    loan_id       uuid      default gen_random_uuid()     not null
        primary key,
    item_id       uuid
        references public.items,
    borrower_name varchar   default ''::character varying not null,
    loan_date     timestamp default (now() AT TIME ZONE 'utc'::text),
    return_date   timestamp,
    status        boolean
);

comment on table public.loans is 'Rekod barang yang dipinjamkan kepada orang lain.';

alter table public.loans
    owner to postgres;

create policy "CRUD access" on public.loans
    as permissive
    for all
    to anon
    using true
with check true;

grant delete, insert, references, select, trigger, truncate, update on public.loans to anon;

grant delete, insert, references, select, trigger, truncate, update on public.loans to authenticated;

grant delete, insert, references, select, trigger, truncate, update on public.loans to service_role;

