prompt - table oehr_countries

create table oehr_countries (
  country_id   char(2 char)      not null,
  country_name varchar2(40 char) ,
  region_id    number            ,
  --
  primary key (country_id)
  --
) organization index;

comment on table oehr_countries is
  'Country table. Contains 25 rows. References with locations table.';

comment on column oehr_countries.country_id is
  'Primary key of countries table.';

comment on column oehr_countries.country_name is
  'Country name.';

comment on column oehr_countries.region_id is
  'Region ID for the country. Foreign key to region_id column in the departments table.';
