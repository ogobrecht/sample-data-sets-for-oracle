prompt - trigger hr_update_job_history

create or replace trigger hr_update_job_history
  after update of job_id, department_id on hr_employees
  for each row
begin
  hr_add_job_history(
    :old.employee_id,
    :old.hire_date,
    sysdate,
    :old.job_id,
    :old.department_id
  );
end hr_update_job_history;
/