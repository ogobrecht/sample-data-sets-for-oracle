prompt - ref constraints on oehr_departments

alter table oehr_departments modify manager_id  references oehr_employees;
alter table oehr_departments modify location_id references oehr_locations;
