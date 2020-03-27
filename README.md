# Sample Data Sets for Oracle

A collection of common data sets reworked for identity columns and easy installation/deinstallation for testing purposes.

The copyright of the data sets is always under the original creators. A link to the original data set is provided where possible. If you miss a link or information here then please create an issue and provide as much information as possible.

The data sets from Oracle were normally created for a dedicated schema. As I need the models mainly for testing purposes I changed that and omitted all the schema creation parts of the scripts. Instead all objects from a model get a prefix - an example: All object from the customer orders schema are prefixed with `co_`. This allows me to use all models in parallel in a single schema and easily identify the model the object belongs to.

All table scripts are created with the simplest possible options for easy readability - no fancy constraint and index names. Constraints and indexes will be renamed with global helper scripts after the table creation.

## Installation

Because of the use of identity columns and listagg with overflow you need at least an Oracle Database with version 12.2 or higher to install the data sets.

You can install a single data model with the provided scripts in the models subdirectory. There are always three scripts to handle the installation, deinstallation and the the data refresh. Here the example script calls for the customer orders model (co) - please make sure you have set your shell to the correct language settings to match the encoding of the files (example for Windows command line):

1. `set NLS_LANG=AMERICAN_AMERICA.AL32UTF8`
2. `cd customer_orders`
3. `sqlplus user/password@connection_string`
4. `@_install.sql` or `@_refresh_data.sql` or `@_uninstall.sql`

Check the resulting objects:

- `select * from user_objects where generated = 'N' order by object_type, object_name;`
- `select * from user_constraints order by table_name, constraint_name;`

## Roadmap, Copyrights

The list of data sets:

- [x] EMP & DEPT ([source][ed], original script), Copyright Oracle ([license][oradn])
- [x] Order Entry & Human Resources ([source oe][oe], [source hr][hr]), Copyright Oracle ([license][ora])
- [x] Customer Orders ([source][co]), Copyright Oracle ([license][ora])
- [ ] movies ([source][m]), Copyright xxx ([license][xxx])
- [] ? (create an issue or a pull request)

For more info about the Oracle sample schemas see the [docs][oradoc].

The list of global helper scripts:

- [x] Create missing foreign key indexes
- [x] Disable/enable all foreign key constraints
- [x] Unify constraint names
- [x] Unify index names
- [ ] Reset identity columns for all tables
- [] ? (create an issue or a pull request)

Hope this helps someone else...

Happy data modeling and testing
Ottmar

[co]: https://github.com/oracle/db-sample-schemas/tree/master/customer_orders
[ed]: https://github.com/oracle/dotnet-db-samples/blob/master/schemas/scott.sql
[hr]: https://github.com/oracle/db-sample-schemas/tree/master/human_resources
[m]: ???
[ora]: https://github.com/oracle/db-sample-schemas/blob/master/LICENSE.md
[oradn]: https://github.com/oracle/dotnet-db-samples/blob/master/LICENSE
[oradoc]: https://docs.oracle.com/database/121/COMSC/overview.htm#COMSC002
