prompt - ref constraints on oehr_order_items

alter table oehr_order_items modify order_id   references oehr_orders on delete cascade;
alter table oehr_order_items modify product_id references oehr_product_information;
