@../_global_scripts/disable_foreign_key_constraints.sql "{ table_filter: 'CO_%', dry_run: false }"

prompt REMOVE DATA

prompt - truncate table co_customers
truncate table co_customers;

prompt - truncate table co_order_items
truncate table co_order_items;

prompt - truncate table co_orders
truncate table co_orders;

prompt - truncate table co_products
truncate table co_products;

prompt - truncate table co_stores
truncate table co_stores;