prompt - ref constraints on oehr_orders

alter table oehr_orders modify customer_id  references oehr_customers on delete set null;
alter table oehr_orders modify sales_rep_id references oehr_employees on delete set null;
