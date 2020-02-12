prompt - trigger oehr_secure_employees

create or replace trigger oehr_secure_employees
  before insert or update or delete on oehr_employees
begin
  oehr_secure_dml;
end oehr_secure_employees;
/