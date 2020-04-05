prompt - type drs_address_t

create or replace type drs_address_t as object (
  address_id   integer,
  address      varchar2(50 char),
  address2     varchar2(50 char),
  district     varchar2(20 char),
  city         drs_city_t,
  postal_code  varchar2(10 char),
  phone        varchar2(20 char),
  last_update  date
);
/