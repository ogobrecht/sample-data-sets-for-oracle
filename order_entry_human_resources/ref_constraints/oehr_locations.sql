prompt - ref constraints on oehr_locations

alter table oehr_locations modify country_id references oehr_countries;
