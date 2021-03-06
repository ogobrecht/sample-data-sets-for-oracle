prompt - table oehr_order_items

create table oehr_order_items (
  order_id      integer     ,
  line_item_id  number(3)   not null,
  product_id    integer     not null,
  unit_price    number(8,2) ,
  quantity      number(8)   ,
  order_item_id integer     generated by default on null as identity (nocycle),
  --
  primary key (order_item_id)
) ;

comment on table oehr_order_items is
  'Example of many-to-many resolution.';

comment on column oehr_order_items.order_id is
  'Part of concatenated primary key, references orders.order_id.';

comment on column oehr_order_items.line_item_id is
  'Part of concatenated primary key.';

comment on column oehr_order_items.product_id is
  'References oehr_product_information.product_id.';
