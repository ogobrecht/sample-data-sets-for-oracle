prompt --view co_product_orders

create or replace view co_product_orders as
  select
    p.product_name,
    o.order_status,
    sum(oi.quantity * oi.unit_price) total_sales,
    count(*) order_count
  from
         co_orders o
    join co_order_items oi on o.order_id    = oi.order_id
    join co_customers c    on o.customer_id = c.customer_id
    join co_products p     on oi.product_id = p.product_id
  group by
    p.product_name,
    o.order_status;
  
comment on table co_product_orders
  is 'A summary of the state of the orders placed for each product';
  
comment on column co_product_orders.product_name 
  is 'What this product is called';
  
comment on column co_product_orders.order_status 
  is 'The current state of these order';
  
comment on column co_product_orders.total_sales 
  is 'The total value of orders placed';
  
comment on column co_product_orders.order_count 
  is 'The total number of orders placed';