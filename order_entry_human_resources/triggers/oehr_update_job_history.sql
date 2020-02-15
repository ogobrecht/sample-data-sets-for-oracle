prompt - trigger oehr_update_job_history

create or replace trigger oehr_update_job_history
  after update of job_id, department_id on oehr_employees
  for each row
begin
  insert into oehr_job_history (
      employee_id,
      start_date,
      end_date,
      job_id,
      department_id
    )
    values (
      :old.employee_id,
      :old.hire_date,
      sysdate,
      :old.job_id,
      :old.department_id
    );
end oehr_update_job_history;
/