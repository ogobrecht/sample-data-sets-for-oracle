prompt - table drs_category

create table drs_category (
  category_id integer           generated by default on null as identity,
  name        varchar2(25 char) not null ,
  last_update date              not null ,
  --
  primary key (category_id)
);