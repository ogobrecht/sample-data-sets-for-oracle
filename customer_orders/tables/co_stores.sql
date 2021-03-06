prompt - table co_stores

create table co_stores (
  store_id          integer            generated by default on null as identity,
  store_name        varchar2(255 char) not null,
  web_address       varchar2(100 char) ,
  physical_address  varchar2(512 char) ,
  latitude          number             ,
  longitude         number             ,
  logo              blob               ,
  logo_mime_type    varchar2(512 char) ,
  logo_filename     varchar2(512 char) ,
  logo_charset      varchar2(512 char) ,
  logo_last_updated date               ,
  --
  primary key (store_id),
  unique      (store_name),
  check       (coalesce (web_address, physical_address) is not null)
);

comment on table co_stores is
  'Physical and virtual locations where people can purchase products';

comment on column co_stores.store_id is
  'Auto-incrementing primary key';

comment on column co_stores.store_name is
  'What the store is called';

comment on column co_stores.web_address is
  'The URL of a virtual store';

comment on column co_stores.physical_address is
  'The postal address of this location';

comment on column co_stores.latitude is
  'The north-south position of a physical store';

comment on column co_stores.longitude is
  'The east-west position of a physical store';

comment on column co_stores.logo is
  'An image used by this store';

comment on column co_stores.logo_mime_type is
  'The mime-type of the store logo';

comment on column co_stores.logo_filename is
  'The name of the file loaded in the image column';

comment on column co_stores.logo_charset is
  'The character set used to encode the image';

comment on column co_stores.logo_last_updated is
  'The date the image was last changed';