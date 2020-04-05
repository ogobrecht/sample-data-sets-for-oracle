prompt - type drs_actor_t (row)

create or replace type drs_actor_t as object (
  actor_id     integer,
  first_name   varchar2(45 char),
  last_name    varchar2(45 char),
  last_update  date
);
/


prompt - type drs_actors_t (tab)

create or replace type drs_actors_t as
  table of drs_actor_t;
/