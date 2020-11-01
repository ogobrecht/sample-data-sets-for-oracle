# Sample Data Sets for Oracle

A collection of common data sets reworked for identity columns and easy installation/deinstallation for testing purposes.

The copyright of the data sets is always under the original creators. A link to the original data set is provided where possible. If you miss here a link or information then please create an issue and provide as much information as possible.

## Why and How

The data sets from Oracle were normally created for a dedicated schema. As I need the data sets mainly for testing purposes I changed that and omitted all the schema creation parts of the scripts. Instead all objects from a data set get a prefix - an example: All object from the customer orders schema are prefixed with `CO_`. This allows me to use all data sets in parallel in a single schema and easily identify the data set the object belongs to.

All table scripts are created with the simplest possible options for easy readability - no fancy constraint and index names. Constraints and indexes will be renamed with global helper scripts after the table creation. Only real indexes are coded - foreign key indexes are generated with a global helper script.

## Installation

Because of the use of identity columns and listagg with overflow you need at least an Oracle Database with version 12.2 or higher to install the data sets.

You can install a single data set with the provided scripts in the data set subdirectory. There are always three scripts to handle the installation, deinstallation and the the data refresh. Here the example script calls for the customer orders data set (CO) - please make sure you have set your shell to the correct language settings to match the encoding of the files (example for Windows command line):

1. `set NLS_LANG=AMERICAN_AMERICA.AL32UTF8`
2. `cd customer_orders`
3. `sqlplus user/password@connection_string`
4. `@_install.sql` or `@_refresh_data.sql` or `@_uninstall.sql`

## List of Data Sets, Copyrights

- EMP & DEPT (2 tabs, 18 rows), [source](https://github.com/oracle/dotnet-db-samples/blob/master/schemas/scott.sql), Copyright Oracle ([MIT license](https://github.com/oracle/dotnet-db-samples/blob/master/LICENSE))
- Order Entry & Human Resources (15 tabs, 3.002 rows), [source oe](https://github.com/oracle/db-sample-schemas/tree/master/order_entry), [source hr](https://github.com/oracle/db-sample-schemas/tree/master/human_resources), Copyright Oracle ([MIT license](https://github.com/oracle/db-sample-schemas/blob/master/LICENSE.md))
- Customer Orders (5 tabs, 6.325 rows), [source](https://github.com/oracle/db-sample-schemas/tree/master/customer_orders), Copyright Oracle ([MIT license](https://github.com/oracle/db-sample-schemas/blob/master/LICENSE.md))
- Sakila DVD Rental Store (16 tabs, 46.273 rows), [source](https://github.com/jOOQ/jOOQ/tree/master/jOOQ-examples/Sakila), [original source](https://code.google.com/archive/p/sakila-sample-database-ports/), Copyright MySQL AB documentation team, DB Software Laboratory, Lukas Eder ([BSD-3-Clause license](http://opensource.org/licenses/BSD-3-Clause))

For more info about the Oracle sample schemas see the [docs](https://docs.oracle.com/database/121/COMSC/overview.htm#COMSC002).

## List of Global Helper Scripts

- Create missing foreign key indexes
- Disable/enable foreign key constraints
- Disable/enable triggers
- Sync sequence values to data
- Unify constraint names
- Unify index names

Hope this helps someone else...

Happy data modeling and testing\
Ottmar
