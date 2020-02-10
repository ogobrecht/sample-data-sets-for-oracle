# Global Helper Scripts

There are some global helper scripts existing in this repository to avoid repeating code.

## Disable All Foreign Key Constraints

Example: `disable_all_foreign_key_constraints.sql hr`

Disables all foreign key constraints related to the tables of the hr model (parameter translates to `table_name like 'HR_%'`).

## Enable All Foreign Key Constraints

Example: `enable_all_foreign_key_constraints.sql hr`

Enables all foreign key constraints related to the tables of the hr model (parameter translates to `table_name like 'HR_%'`).

## Manage Constraint Names

example: `manage_constraint_names.sql hr`

Generate unique constraint names, which are constructed in this way:

1. Table name followed by underscore
2. Constraint type (PK, FK, UK, CK and NN for single column not null check constraints followed by underscore
3. List of ordered table column id's of this constraint followed by underscore
4. Additional underscore, if the new constraint name is not unique - you can check this later with `constraint_name like '%\_' escape '\'`

EXAMPLES

- `DEMO_NN_C3` not null check on column 3  (`column_name is not null`)
- `DEMO_PK_C1` primary key on column 1
- `DEMO_FK_C3` foreign key on column 3
- `DEMO_UK_C3_C5` unique key on columns 3 and 5
- `DEMO_CK_C1_C4_C11` some check constraint on columns 1, 4 and 11
- `DEMO_CK_C4` a check on column 4
- `DEMO_CK_C4_` another check on column 4, the script appends up to three underscores to generate unique names; If you need more then align the script

## Manage Index Names

example: `manage_index_names.sql hr`

Generate unique constraint names, which are constructed in this way:

1. Table name followed by underscore
2. Constraint type (PK, FK, UK, CK and NN for single column not null check constraints followed by underscore
3. List of ordered table column id's of this constraint followed by underscore
4. Additional underscore, if the new constraint name is not unique - you can check this later with `constraint_name like '%\_' escape '\'`

EXAMPLES

- `DEMO_NN_C3` not null check on column 3  (`column_name is not null`)
- `DEMO_PK_C1` primary key on column 1
- `DEMO_FK_C3` foreign key on column 3
- `DEMO_UK_C3_C5` unique key on columns 3 and 5
- `DEMO_CK_C1_C4_C11` some check constraint on columns 1, 4 and 11
- `DEMO_CK_C4` a check on column 4
- `DEMO_CK_C4_` another check on column 4, the script appends up to three underscores to generate unique names; If you need more then align the script
