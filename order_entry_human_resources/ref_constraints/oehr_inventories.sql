prompt - ref constraints on oehr_inventories

alter table oehr_inventories modify product_id   references oehr_product_information;
alter table oehr_inventories modify warehouse_id references oehr_warehouses;
