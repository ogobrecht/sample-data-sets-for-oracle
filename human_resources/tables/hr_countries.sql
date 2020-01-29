prompt - table hr_countries

create table hr_countries (
  country_id   char(2) not null primary key,
  country_name varchar2(40),
  region_id    integer references regions
) organization index; 

comment on table hr_countries is
  'Country table. Contains 25 rows. References with locations table.';

comment on column hr_countries.country_id is
  'Primary key of countries table.';

comment on column hr_countries.country_name is
  'Country name.';

comment on column hr_countries.region_id is
  'Region ID for the country. Foreign key to region_id column in the departments table.';
