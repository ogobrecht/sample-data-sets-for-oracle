prompt - ref constraints on hr_departments

alter table hr_departments modify manager_id  references hr_employees;
alter table hr_departments modify location_id references hr_locations;
