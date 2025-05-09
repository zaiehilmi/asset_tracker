create table public.items
(
    item_id           uuid                     default gen_random_uuid()                not null
        primary key
        unique,
    name              varchar                                                           not null,
    purchase_date     date,
    expiry_date       date,
    price             numeric,
    location          text,
    notes             text,
    source            sources,
    category          categories,
    added_date        timestamp with time zone default (now() AT TIME ZONE 'utc'::text) not null,
    barcode           text
        constraint items_barcode_check
            check (length(barcode) <= 20),
    parent_item_id    uuid
        references public.items,
    last_updated_date timestamp with time zone default (now() AT TIME ZONE 'Asia/Kuala_Lumpur'::text),
    status            status                   default 'tersedia'::status               not null,
    url_link          text
        constraint items_url_link_check
            check (url_link ~* '^https?://'::text)
);

comment on table public.items is 'Rekod semua barangan peribadi.';

comment on column public.items.location is 'di mana terletaknya item';

comment on column public.items.source is 'asal-usul perolehan item';

comment on column public.items.category is 'kategori barangan (e.g., elektronik, pakaian).';

comment on column public.items.added_date is 'Tarikh dan masa bila ia ditambah';

comment on column public.items.barcode is 'Jika ada kod bar, gunakan ia untuk carian pantas';

comment on column public.items.parent_item_id is 'Menyimpan item_id kepada item asal yang di-topup';

comment on column public.items.last_updated_date is 'Kemaskini terakhir jika ada';

comment on column public.items.status is 'status terkini item atau barangan tersebut';

comment on column public.items.url_link is 'pautan untuk yang berkaitan dengan item macam Shopee, Samsung, ...';

alter table public.items
    owner to postgres;

create policy "CRUD access" on public.items
    as permissive
    for all
    to anon
    using true;

grant delete, insert, references, select, trigger, truncate, update on public.items to anon;

grant delete, insert, references, select, trigger, truncate, update on public.items to authenticated;

grant delete, insert, references, select, trigger, truncate, update on public.items to service_role;

