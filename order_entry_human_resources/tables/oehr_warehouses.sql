prompt - table oehr_warehouses

create table oehr_warehouses (
  warehouse_id number(3),
  warehouse_name varchar2(35 char),
  location_id number(4)
);

comment on table oehr_warehouses is
  'warehouse data unspecific to any industry.';

comment on column oehr_warehouses.warehouse_id is
  'primary key column.';

comment on column oehr_warehouses.location_id is
  'primary key column, references oehr_locations.location_id.';
