prompt - view co_store_orders_status

create or replace view co_store_orders_status as
  select
    s.store_name,
    coalesce(s.web_address, s.physical_address) address,
    s.latitude,
    s.longitude,
    o.order_status,
    count(distinct o.order_id) order_count,
    sum(oi.quantity * oi.unit_price) total_sales
  from
         co_stores      s
    join co_orders      o  on s.store_id = o.store_id
    join co_order_items oi on o.order_id = oi.order_id
  group by
    s.store_name,
    coalesce(s.web_address, s.physical_address),
    s.latitude,
    s.longitude,
    o.order_status;

comment on table co_store_orders_status is
  'A summary of what was purchased at each location for each order status';

comment on column co_store_orders_status.store_name is
  'What the store is called';

comment on column co_store_orders_status.address is
  'The physical or virtual location of this store';

comment on column co_store_orders_status.latitude is
  'The north-south position of a physical store';

comment on column co_store_orders_status.longitude is
  'The east-west position of a physical store';

comment on column co_store_orders_status.order_status is
  'The current state of this order';

comment on column co_store_orders_status.order_count is
  'The primary key of the order';

comment on column co_store_orders_status.total_sales is
  'The total value of orders placed';
