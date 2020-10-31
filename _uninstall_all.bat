@echo off
set NLS_LANG=AMERICAN_AMERICA.AL32UTF8

cd emp_dept
echo exit | sqlplus -S /@playground @_uninstall.sql

cd ..\order_entry_human_resources
echo exit | sqlplus -S /@playground @_uninstall.sql

cd ..\customer_orders
echo exit | sqlplus -S /@playground @_uninstall.sql

cd ..\dvd_rental_store
echo exit | sqlplus -S /@playground @_uninstall.sql

cd ..

pause