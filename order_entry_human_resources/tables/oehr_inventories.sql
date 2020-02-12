prompt - table oehr_inventories

create table oehr_inventories (
  product_id       number(6) ,
  warehouse_id     number(3) not null,
  quantity_on_hand number(8) not null,
  --
  primary key (product_id, warehouse_id)
);

comment on table oehr_inventories is
  'Tracks availability of products by product_id and warehouse_id.';

comment on column oehr_inventories.product_id is
  'Part of concatenated primary key, references oehr_product_information.product_id.';

comment on column oehr_inventories.warehouse_id is
  'Part of concatenated primary key, references oehr_warehouses.warehouse_id.';

comment on column oehr_inventories.quantity_on_hand is
  'Available number of items of the referenced product in the referenced warehouse.';
