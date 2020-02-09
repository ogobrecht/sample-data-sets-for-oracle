prompt - trigger hr_secure_employees

create or replace trigger hr_secure_employees
  before insert or update or delete on hr_employees
begin
  hr_secure_dml;
end hr_secure_employees;
/