prompt - type drs_language_t (row)

create or replace type drs_language_t as object (
  language_id  integer,
  name         varchar2(20 char),
  last_update  date
);
/


prompt - type drs_languages_t (tab)

create or replace type drs_languages_t as
  table of drs_language_t;
/