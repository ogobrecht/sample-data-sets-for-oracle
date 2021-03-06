@../_global_scripts/disable_foreign_key_constraints.sql "table_prefix=co  dry_run=false"

prompt DROP OBJECTS

prompt - view co_customer_order_products
drop view co_customer_order_products;

prompt - view co_product_orders
drop view co_product_orders;

prompt - view co_product_reviews
drop view co_product_reviews;

prompt - view co_store_orders_status
drop view co_store_orders_status;

prompt - view co_store_orders
drop view co_store_orders;

prompt - table co_customers
drop table co_customers cascade constraints purge;

prompt - table co_inventory
drop table co_inventory cascade constraints purge;

prompt - table co_order_items
drop table co_order_items cascade constraints purge;

prompt - table co_orders
drop table co_orders cascade constraints purge;

prompt - table co_products
drop table co_products cascade constraints purge;

prompt - table co_shipments
drop table co_shipments  cascade constraints purge;

prompt - table co_stores
drop table co_stores cascade constraints purge;