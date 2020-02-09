prompt - procedure hr_secure_dml

create or replace procedure hr_secure_dml
is
begin
  if to_char (sysdate, 'HH24:MI') not between '08:00' and '18:00'
  or to_char (sysdate, 'DY', 'nls_date_language=english') in ('SAT', 'SUN') then
    raise_application_error (-20205, 'You may only make changes during normal office hours');
  end if;
end hr_secure_dml;
/