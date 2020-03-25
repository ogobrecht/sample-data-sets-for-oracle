prompt CREATE OBJECTS

@tables/co_customers.sql
@tables/co_order_items.sql
@tables/co_orders.sql
@tables/co_products.sql
@tables/co_stores.sql

@indexes/co_customers.sql
@indexes/co_orders.sql

@ref_constraints/co_order_items.sql
@ref_constraints/co_orders.sql

@views/co_customer_order_products.sql
@views/co_product_orders.sql
@views/co_product_reviews.sql
@views/co_store_orders_status.sql
@views/co_store_orders.sql

@../_global_scripts/create_missing_fk_indexes.sql CO
@../_global_scripts/unify_index_names.sql CO
@../_global_scripts/unify_constraint_names.sql CO
