prompt - table oehr_product_descriptions
create table oehr_product_descriptions (
  product_id             number(6)            ,
  language_id            varchar2(3 char)     ,
  translated_name        nvarchar2(50 char)   not null,
  translated_description nvarchar2(2000 char) not null,
  --
  primary key (product_id, language_id)
);

comment on table oehr_product_descriptions  is
  'Non-industry-specific design, allows selection of nls-setting-specific data derived at runtime, for example using the products view.';

comment on column oehr_product_descriptions.product_id is
  'Product ID, primary key column.';

comment on column oehr_product_descriptions.language_id is
  'Language ID, primary key column.';

