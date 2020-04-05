prompt - table drs_film_category

create table drs_film_category (
  film_id     integer not null ,
  category_id integer not null ,
  last_update date    not null ,
  --
  primary key (film_id, category_id)
);
