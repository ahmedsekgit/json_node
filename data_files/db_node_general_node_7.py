==============================
How to import a single table in to mysql database using command line  
==============================


Linux :

In command line

 mysql -u username -p  databasename  < path/example.sql

put your table in example.sql

Import / Export for single table:

    Export table schema

    mysqldump -u username -p databasename tableName > path/example.sql

    This will create a file named example.sql at the path mentioned and write the create table sql command to create table tableName.

    Import data into table

    mysql -u username -p databasename < path/example.sql

    This command needs an sql file containing data in form of insert statements for table tableName. All the insert statements will be executed and the data will be loaded.

  
==============================
7 at  2021-10-29T15:22:52.000Z
==============================
