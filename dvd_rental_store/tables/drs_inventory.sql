prompt - table drs_inventory

create table drs_inventory (
  inventory_id integer generated by default on null as identity,
  film_id      integer not null ,
  store_id     integer not null ,
  last_update  date    not null ,
  --
  primary key (inventory_id)
);
