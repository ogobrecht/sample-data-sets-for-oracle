# Oracle Sample Data Models

A collection of common data models reworked for identity columns and easy installation/deinstallation for testing purposes.

The copyright of the data models is always under the original creators. A link to the original data model is provided where possible. If you miss a link or information here then please create an issue and provide as much information as possible.

The data models from Oracle were normally created for a dedicated schema. As I need the models mainly for testing purposes I changed that and omitted all the schema creation parts of the scripts. Instead all objects from a model get a prefix - an example: All object from the human resources schema are prefixed with `hr_`. This allows me to use all models in parallel in a single schema and easily identify the model the object belongs to. As I mentioned - for testing this is useful.

All table scripts are created with the simplest possible options for easy readability - no fancy constraint names. Constraints will be renamed with a helper script after the table creation.

You can install a singe data models with the provided scripts in the subdirectory of the model. You will find always three scripts to handle this - here the example script calls for the customer orders model (co):

- `@co/_install.sql`
- `@co/_refresh_data.sql`
- `@co/_uninstall.sql`

If you want to install more or all models in one go then you can use the script in the project root called `_install_all.sql`. Please edit this script before you start it to select what you want.

Here the list of data models which I want to provide in a first iterations:

- [ ] [Customer Orders][co], created by Oracle (the newest sample schema so far)
- [ ] [Human Resources][hr], created by Oracle

Hope this helps someone else...

Happy data modeling  
Ottmar

[co]: https://github.com/oracle/db-sample-schemas/tree/master/customer_orders
[hr]: https://github.com/oracle/db-sample-schemas/tree/master/human_resources