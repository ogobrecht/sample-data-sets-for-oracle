prompt - type drs_city_t

create or replace type drs_city_t as object (
  city_id      integer,
  city         varchar2(50 char),
  country      drs_country_t,
  last_update  date
);
/