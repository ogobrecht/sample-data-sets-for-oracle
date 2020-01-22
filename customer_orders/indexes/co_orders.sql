prompt - indexes on co_orders

create index co_orders_customer_id_ix on co_orders (customer_id);
create index co_orders_store_id_ix on co_orders (store_id);
