prompt - indexes on hr_locations

create index hr_loc_country_ix on hr_locations (country_id);

create index hr_loc_city_ix on hr_locations (city);

create index hr_loc_state_province_ix on hr_locations (state_province);
