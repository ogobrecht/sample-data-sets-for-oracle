create package body customers as

  function get_customer (p_customer_id number)
    return person
  is
    v_person customers.person;
  begin
    select
      c.first_name,
      c.last_name
    into v_person
    from
      customer c
    where
      c.customer_id = p_customer_id;

    return v_person;
  end get_customer;

end customers;
/