prompt - ref constraints on co_order_items

alter table co_order_items modify product_id references co_products;
