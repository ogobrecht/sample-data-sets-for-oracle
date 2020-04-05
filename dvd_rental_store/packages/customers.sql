create package customers as
  type person is record (
    first_name varchar2(50 char),
    last_name  varchar2(50 char)
  );

  function get_customer (p_customer_id number)
    return person;

end customers;
/