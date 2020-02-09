prompt - ref constraints on co_orders

alter table co_orders modify customer_id references co_customers;
alter table co_orders modify store_id    references co_stores;
