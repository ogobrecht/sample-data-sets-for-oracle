prompt - table drs_film_actor

create table drs_film_actor (
  actor_id    integer not null ,
  film_id     integer not null ,
  last_update date    not null ,
  --
  primary key (actor_id, film_id)
);
