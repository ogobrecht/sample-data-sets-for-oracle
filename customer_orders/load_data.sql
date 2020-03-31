prompt LOAD DATA

@data/co_customers.sql
@data/co_order_items.sql
@data/co_orders.sql
@data/co_products.sql
@data/co_stores.sql

prompt - commit work
commit;

@../_global_scripts/enable_all_foreign_key_constraints.sql "CO"
@../_global_scripts/sync_sequence_values_to_data.sql "CO"
