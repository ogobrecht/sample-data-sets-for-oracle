prompt - package spec drs_customers

create package drs_customers as
  type person is record (
    first_name varchar2(50 char),
    last_name  varchar2(50 char)
  );

  function get_customer (p_customer_id number)
    return person;

end drs_customers;
/