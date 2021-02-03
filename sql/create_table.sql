create table if not exists malicious_url (
    id int generated always as identity primary key ,
    url text not null,
    created_at timestamptz not null default now()
);
/* since the url text may be extremely long(thousands of characters) and may exceed the limit of btree index,
md5 hash is used first */
create unique index if not exists "url_hash_idx" on malicious_url(md5(lower(url)));

create table if not exists malicious_url_detail (
    url_id int references malicious_url(id) on delete cascade,
    source text not null,
    source_id text,
    verification_time timestamptz not null,
    primary key (url_id, source)
);
create index if not exists detail_url_id_idx on malicious_url_detail(url_id);