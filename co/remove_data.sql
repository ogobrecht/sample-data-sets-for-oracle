prompt REMOVE DATA

prompt --co_order_items
truncate table co_order_items;

prompt --co_orders
delete co_orders;

prompt --co_stores
delete co_stores;

prompt --co_customers
delete co_customers;

prompt --co_products
delete co_products;