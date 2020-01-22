prompt - view co_customer_order_products

create or replace view co_customer_order_products as
  select
    o.order_id,
    o.order_datetime,
    o.order_status,
    c.customer_id,
    c.email_address,
    c.full_name,
    sum(oi.quantity * oi.unit_price) order_total,
    listagg(p.product_name, ', ' on overflow truncate '...' with count) within group(order by oi.line_item_id) items
  from
         co_orders o
    join co_order_items oi on o.order_id    = oi.order_id
    join co_customers c    on o.customer_id = c.customer_id
    join co_products p     on oi.product_id = p.product_id
  group by
    o.order_id,
    o.order_datetime,
    o.order_status,
    c.customer_id,
    c.email_address,
    c.full_name;

comment on table co_customer_order_products
  is 'A summary of who placed each order and what they bought';

comment on column co_customer_order_products.order_id 
  is 'The primary key of the order';

comment on column co_customer_order_products.order_datetime 
  is 'The date and time the order was placed';

comment on column co_customer_order_products.order_status 
  is 'The current state of this order';

comment on column co_customer_order_products.customer_id 
  is 'The primary key of the customer';

comment on column co_customer_order_products.email_address 
  is 'The email address the person uses to access the account';

comment on column co_customer_order_products.full_name 
  is 'What this customer is called';

comment on column co_customer_order_products.order_total 
  is 'The total amount the customer paid for the order';

comment on column co_customer_order_products.items 
  is 'A comma-separated list naming the products in this order';