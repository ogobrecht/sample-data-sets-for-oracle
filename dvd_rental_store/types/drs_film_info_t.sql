prompt - type drs_film_info_t

create or replace type drs_film_info_t as object (
  film        drs_film_t,
  actors      drs_actors_t,
  categories  drs_categories_t
);
/