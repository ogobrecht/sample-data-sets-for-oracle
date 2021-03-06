prompt - table drs_rental

create table drs_rental (
  rental_id       integer generated by default on null as identity,
  rental_date     date                 not null ,
  inventory_id    integer              not null ,
  customer_id     integer              not null ,
  return_date     date    default null          ,
  staff_id        integer              not null ,
  last_update     date                 not null ,
  --
  primary key (rental_id),
  unique      (rental_date, inventory_id, customer_id)
);

