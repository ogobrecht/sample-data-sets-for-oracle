# Manage Constraint Names

Generate unique constraint names, which are constructed in this way:

1. Table name followed by underscore
2. Constraint type (PK, FK, UK, CK and NN for single column not null check constraints followed by underscore
3. List of ordered table column id's of this constraint followed by underscore
4. Additional underscore, if the new constraint name is not unique - you can check this later with `constraint_name like '%\_' escape '\'` 

EXAMPLES

  - `DEMO_NN_C3` Check constraints like `column_name is not null` are marked as NN
  - `DEMO_PK_C1`
  - `DEMO_FK_C3`
  - `DEMO_UK_C3_C5`
  - `DEMO_CK_C1_C4_C11`
  - `DEMO_CK_C4`
  - `DEMO_CK_C4_` Here we have a new non unique constraint name, the script appends up to three underscores; If you need more then align the script

For the SQL script see file `manage_constraint_names.sql`.