prompt - type drs_customer_t (row)

create or replace type drs_customer_t as object (
  customer_id  integer,
  first_name   varchar2(45 char),
  last_name    varchar2(45 char),
  email        varchar2(50 char),
  address      drs_address_t,
  active       char(1 byte),
  create_date  date,
  last_update  date
);
/


prompt - type drs_customers_t (tab)

create or replace type drs_customers_t as
  table of drs_customer_t;
/