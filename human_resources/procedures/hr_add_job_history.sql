prompt - procedure hr_add_job_history

create or replace procedure hr_add_job_history (
  p_emp_id        hr_job_history.employee_id%type,
  p_start_date    hr_job_history.start_date%type,
  p_end_date      hr_job_history.end_date%type,
  p_job_id        hr_job_history.job_id%type,
  p_department_id hr_job_history.department_id%type) is
begin
  insert into hr_job_history (
    employee_id,
    start_date,
    end_date,
    job_id,
    department_id
  )
  values (
    p_emp_id,
    p_start_date,
    p_end_date,
    p_job_id,
    p_department_id
  );
end hr_add_job_history;
/