/*

Compile and Check Objects
=========================

Compile all invalid objects and check, if there are invalid objects left.

Options
-------

The first parameter of the script can contain one option:

- throw_error:
  - If true, the script will terminate with a SQL error when one or more objects are invalid
  - If false, the script will only report the invalid objects
  - If omitted, it will default to true

Examples
--------

    @compile_and_check_objects
    @compile_and_check_objects "throw_error=true"
    @compile_and_check_objects "throw_error=false"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [compile_and_check_objects.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-11-01

*/

prompt COMPILE AND CHECK OBJECTS
set define on serveroutput on verify off feedback off linesize 120

declare
  v_throw_error varchar2(100);
  v_number_invalid_objects pls_integer;
  v_object_list            varchar2(4000);
  function get_number_invalid_objects return number is
  begin
    for i in (
      select count(*) as invalid_objects
      from user_objects
      where status = 'INVALID')
    loop
      return i.invalid_objects;
    end loop;
  end;
begin
  v_throw_error := nvl(lower(regexp_substr('&1','throw_error=(true|false)',1,1,'i',1)), 'true');
  v_number_invalid_objects := get_number_invalid_objects;
  if get_number_invalid_objects = 0 then
    dbms_output.put_line('- nothing to compile :-)');
  else
    dbms_output.put_line(
      '- compile ' || v_number_invalid_objects || ' invalid object'
      || case when v_number_invalid_objects != 1 then 's' end);
    dbms_utility.compile_schema(
      schema         => user,
      compile_all    => false,
      reuse_settings => true);
    v_number_invalid_objects := get_number_invalid_objects;
    if v_number_invalid_objects > 0 then
      select listagg(
                '- ' || object_type || ' ' || object_name,
                chr(10) on overflow truncate)
                within group (order by object_type, object_name)
      into   v_object_list
      from   user_objects
      where  status = 'INVALID';
      dbms_output.put_line(
        '- still ' || v_number_invalid_objects || ' invalid object'
        || case when v_number_invalid_objects > 1 then 's' end
        || ' after compilation :-(');
      if v_throw_error = 'false' then
        dbms_output.put_line('- --------------------------------------------------');
        dbms_output.put_line(v_object_list);
        dbms_output.put_line('- --------------------------------------------------');
      else
        raise_application_error(
          -20000,
          chr(10)
          || '--------------------------------------------------' || chr(10)
          || v_number_invalid_objects || ' Invalid Object'
          || case when v_number_invalid_objects > 1 then 's' end
          || ' After Schema Compilation' || chr(10)
          || '--------------------------------------------------' || chr(10)
          || v_object_list || chr(10)
          || '--------------------------------------------------' || chr(10));
      end if;
    end if;
  end if;
end;
/
