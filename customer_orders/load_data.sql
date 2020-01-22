prompt LOAD DATA

@data/co_customers.sql
@data/co_products.sql
@data/co_stores.sql
@data/co_orders.sql
@data/co_order_items.sql

prompt - commit work
commit;

@reset_identity_columns.sql