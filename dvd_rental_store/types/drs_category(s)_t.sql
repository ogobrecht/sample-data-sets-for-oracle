prompt - type drs_category_t (row)

create or replace type drs_category_t as object (
  category_id  integer,
  name         varchar2(25 char),
  last_update  date
);
/


prompt - type drs_categories_t (tab)

create or replace type drs_categories_t as
  table of drs_category_t;
/