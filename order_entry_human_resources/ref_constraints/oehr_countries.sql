prompt - ref constraints on oehr_countries

alter table oehr_countries modify region_id references oehr_regions;
