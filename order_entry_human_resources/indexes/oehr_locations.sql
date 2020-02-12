prompt - indexes on oehr_locations

create index oehr_loc_city_ix           on oehr_locations (city);
create index oehr_loc_country_ix        on oehr_locations (country_id);
create index oehr_loc_state_province_ix on oehr_locations (state_province);
