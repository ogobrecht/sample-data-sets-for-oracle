prompt - table oehr_product_information

create table oehr_product_information (
  product_id number(6),
  product_name varchar2(50 char),
  product_description varchar2(2000 char),
  category_id number(2),
  weight_class number(1),
  warranty_period interval year (2) to month,
  supplier_id number(6),
  product_status varchar2(20 char),
  list_price number(8,2),
  min_price number(8,2),
  catalog_url varchar2(50 char)
) ;

comment on column oehr_product_information.product_id is
  'primary key column.';

comment on column oehr_product_information.product_description is
  'primary language description corresponding to translated_description in oehr_product_descriptions, added to provide non-nls text columns for oc views to access.';

comment on column oehr_product_information.category_id is
  'low cardinality column, can be used for bitmap index. schema sh uses it as foreign key';

comment on column oehr_product_information.weight_class is
  'low cardinality column, can be used for bitmap index.';

comment on column oehr_product_information.warranty_period is
  'interval yeaer to month column, low cardinality, can be used for bitmap index.';

comment on column oehr_product_information.supplier_id is
  'offers possibility of extensions outside common schema.';

comment on column oehr_product_information.product_status is
  'check constraint. appropriate for complex rules, such as all products in status production must have at least one inventory entry. also appropriate for a trigger auditing status change.';

comment on table oehr_product_information  is 'non-industry-specific data in various categories.';
