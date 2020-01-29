# Sample Data Models for Oracle

A collection of common data models reworked for identity columns and easy installation/deinstallation for testing purposes.

The copyright of the data models is always under the original creators. A link to the original data model is provided where possible. If you miss a link or information here then please create an issue and provide as much information as possible.

The data models from Oracle were normally created for a dedicated schema. As I need the models mainly for testing purposes I changed that and omitted all the schema creation parts of the scripts. Instead all objects from a model get a prefix - an example: All object from the customer orders schema are prefixed with `co_`. This allows me to use all models in parallel in a single schema and easily identify the model the object belongs to.

All table scripts are created with the simplest possible options for easy readability - no fancy constraint names. Constraints will be renamed with a helper script after the table creation.


## Installation

Because we use identity columns you need at least an Oracle Database with version 12.1.0.2 or higher.

You can install a singe data model with the provided scripts in the models subdirectory. There are always three scripts to handle the installation, deinstallation and the the data refresh. Here the example script calls for the customer orders model (co) - please make sure you have set your shell to UTF-8 to match the encoding of the files (example for Windows command line):

1. `set NLS_LANG=AMERICAN_AMERICA.AL32UTF8`
2. `cd customer_orders`
3. `sqlplus user/password@connection_string`
4. `@_install.sql` or `@_refresh_data.sql` or `@_uninstall.sql`

To check the resulting objects you can use:

- `select * from user_objects where generated = 'N' order by object_type, object_name;`
- `select * from user_constraints order by table_name, constraint_name;`

Here the list of data models which I want to provide in the first iterations:

- [ ] [Customer Orders][co], created by Oracle (the newest sample schema so far)
- [ ] [Human Resources][hr], created by Oracle

Open Todos:

- [x] Script to automatically manage constraint names
- [ ] Script to automatically create missing fk indexes
- [ ] Script to automatically manage index names


Hope this helps someone else...

Happy data modeling and testing  
Ottmar

[co]: https://github.com/oracle/db-sample-schemas/tree/master/customer_orders
[hr]: https://github.com/oracle/db-sample-schemas/tree/master/human_resources