prompt REMOVE DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql co

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