prompt - table hr_regions

create table hr_regions (
  region_id   integer      generated by default on null as identity,
  region_name varchar2(25) ,
  --
  primary key (region_id)
);

comment on table hr_regions is
  'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';

comment on column hr_regions.region_id is
  'Primary key of regions table.';

comment on column hr_regions.region_name is
  'Names of regions. Locations are in the countries of these regions.';