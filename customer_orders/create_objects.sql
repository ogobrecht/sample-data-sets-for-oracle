prompt CREATE OBJECTS

@tables/co_customers.sql
@tables/co_order_items.sql
@tables/co_orders.sql
@tables/co_products.sql
@tables/co_stores.sql

prompt - 3 ref constraints
alter table co_order_items modify product_id references co_products  disable;
alter table co_orders modify customer_id     references co_customers disable;
alter table co_orders modify store_id        references co_stores    disable;

prompt - 1 index (fk indexes are created later automatically)
create index co_customers_name_ix     on co_customers (full_name);

@views/co_customer_order_products.sql
@views/co_product_orders.sql
@views/co_product_reviews.sql
@views/co_store_orders_status.sql
@views/co_store_orders.sql

@../_global_scripts/create_missing_foreign_key_indexes.sql "{ table_filter: 'CO_%', dry_run: false }"
@../_global_scripts/unify_index_names.sql                  "{ table_filter: 'CO_%', dry_run: false }"
@../_global_scripts/unify_constraint_names.sql             "{ table_filter: 'CO_%', dry_run: false }"
