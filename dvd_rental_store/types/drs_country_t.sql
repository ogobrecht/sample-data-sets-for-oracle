prompt - type drs_country_t

create or replace type drs_country_t as object (
  country_id   integer,
  country      varchar2(50 char),
  last_update  date
);
/