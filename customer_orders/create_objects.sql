prompt CREATE OBJECTS

@tables/co_customers.sql
@tables/co_inventory.sql
@tables/co_order_items.sql
@tables/co_orders.sql
@tables/co_products.sql
@tables/co_shipments.sql
@tables/co_stores.sql

prompt - 1 index (fk indexes are created later automatically)
create index co_customers_name_ix on co_customers (full_name);

@views/co_customer_order_products.sql
@views/co_product_orders.sql
@views/co_product_reviews.sql
@views/co_store_orders_status.sql
@views/co_store_orders.sql

@../_global_scripts/create_missing_foreign_keys.sql        "table_prefix=co  disable=true  dry_run=false"
@../_global_scripts/create_missing_foreign_key_indexes.sql "table_prefix=co  dry_run=false"
@../_global_scripts/unify_index_names.sql                  "table_prefix=co  dry_run=false"
@../_global_scripts/unify_constraint_names.sql             "table_prefix=co  dry_run=false"
