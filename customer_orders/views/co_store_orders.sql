prompt - view co_store_orders

create or replace view co_store_orders as
  select
    case grouping_id(store_name, order_status)
      when 1 then 'STORE TOTAL'
      when 2 then 'STATUS TOTAL'
      when 3 then 'GRAND TOTAL'
    end total,
    s.store_name,
    coalesce(s.web_address, s.physical_address) address,
    s.latitude,
    s.longitude,
    o.order_status,
    count(distinct o.order_id) order_count,
    sum(oi.quantity * oi.unit_price) total_sales
  from
         co_stores s
    join co_orders o       on s.store_id = o.store_id
    join co_order_items oi on o.order_id = oi.order_id
  group by
    grouping sets (
      ( s.store_name,
        coalesce(s.web_address, s.physical_address),
        s.latitude,
        s.longitude ),
      ( s.store_name,
        coalesce(s.web_address, s.physical_address),
        s.latitude,
        s.longitude,
        o.order_status ),
      o.order_status,
      ( )
    );

comment on table co_store_orders
  is 'A summary of what was purchased at each location, including summaries each store, order status and overall total';

comment on column co_store_orders.total 
  is 'Indicates what type of total is displayed, including Store, Status, or Grand Totals';

comment on column co_store_orders.store_name 
  is 'What the store is called';

comment on column co_store_orders.address 
  is 'The physical or virtual location of this store';

comment on column co_store_orders.latitude
  is 'The north-south position of a physical store';

comment on column co_store_orders.longitude
  is 'The east-west position of a physical store';

comment on column co_store_orders.order_status 
  is 'The current state of this order';

comment on column co_store_orders.order_count 
  is 'The total number of orders placed';

comment on column co_store_orders.total_sales 
  is 'The total value of orders placed';
