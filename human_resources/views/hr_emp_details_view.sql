prompt - view hr_emp_details_view

create or replace view emp_details_view as
  select
    e.employee_id,
    e.job_id,
    e.manager_id,
    e.department_id,
    d.location_id,
    l.country_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    d.department_name,
    j.job_title,
    l.city,
    l.state_province,
    c.country_name,
    r.region_name
  from
         employees    e
    join departments  d on e.department_id = d.department_id
    join jobs         j on e.job_id        = j.job_id
    join locations    l on d.location_id   = l.location_id
    join countries    c on l.country_id    = c.country_id
    join regions      r on c.region_id     = r.region_id
with read only;