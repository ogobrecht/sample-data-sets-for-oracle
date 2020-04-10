-- the used select statements to produce the insert statements (with SQL Developer)
select /*insert*/ * from co_customers order by customer_id;
select /*insert*/ * from co_order_items order by order_id;
select /*insert*/ * from co_orders order by order_id;
select /*insert*/ * from co_products order by product_id;
select /*insert*/ * from co_stores order by store_id;

-- overall rows of data
select
  (select count(*) from co_customers) +   --  392
  (select count(*) from co_order_items) + -- 3914
  (select count(*) from co_orders) +      -- 1950
  (select count(*) from co_products) +    --   46
  (select count(*) from co_stores)        --   23
  as sum_rows                             -- 6325
from dual;
