prompt - type drs_film_t (row)

create or replace type drs_film_t as object (
  film_id            integer,
  title              varchar2(255 char),
  description        clob,
  release_year       varchar2(4 char),
  language           drs_language_t,
  original_language  drs_language_t,
  rental_duration    integer,
  rental_rate        number(4, 2),
  length             integer,
  replacement_cost   number(5, 2),
  rating             varchar2(10 char),
  special_features   varchar2(100 char),
  last_update        date
);
/


prompt - type drs_films_t (tab)

create or replace type drs_films_t as
  table of drs_film_t;
/
