==============================
How to backup and restore MySQL databases using the mysqldump command  
==============================
Generate backup using mysqldump utility
mysqldump -u [user name] –p [password] [options] [database_name] [tablename] > [dumpfilename.sql]

The parameters are as following:

    -u [user_name]: It is a username to connect to the MySQL server. To generate the backup using mysqldump, ‘Select‘ to dump the tables, ‘Show View‘ for views, ‘Trigger‘ for the triggers. If you are not using —single-transaction option, then ‘Lock Tables‘ privileges must be granted to the user
    -p [password]: The valid password of the MySQL user
    [option]: The configuration option to customize the backup
    [database name]: Name of the database that you want to take backup
    [table name]: This is an optional parameter. If you want to take the backup specific tables, then you can specify the names in the command
    “<” OR ”>”: This character indicates whether we are generating the backup of the database or restoring the database. You can use “>” to generate the backup and “<” to restore the backup
    [dumpfilename.sql]: Path and name of the backup file. As I mentioned, we can generate the backup in XML, delimited text, or SQL file so we can provide the extension of the file accordingly 

Generate the backup of a single database
mysqldump -u root -p sakila > C:\MySQLBackup\sakila_20200424.sql

Generate the backup of multiple databases or all the databases

mysqldump -u root -p –databases sakila employees > C:\MySQLBackup\sakila_employees_20200424.sql
or for all databases
mysqldump -u root -p –all-databases > C:\MySQLBackup\all_databases_20200424.sql

Generate the backup of database structure
ysqldump -u root -p –no-data sakila > C:\MySQLBackup\sakila_objects_definition_20200424.sql


Generate the backup of a specific table
mysqldump -u root -p sakila actor payment > C:\MySQLBackup\actor_payment_table_20200424.sql

Generate the backup of database data

mysqldump -u root -p sakila –no-create-info > C:\MySQLBackup\sakila_data_only_20200424.sql

Restore the MySQL Database

mysql> drop database sakila;
Query OK, 24 rows affected (0.35 sec)


mysql> create database sakila;
Query OK, 1 row affected (0.01 sec)
mysql>


When you restore the database, instead of using mysqldump, you must use mysql; otherwise, 
the mysqldump will not generate 
the schema and the data. Execute the following command to restore the sakila database: 


mysql -u root -p sakila < C:\MySQLBackup\sakila_20200424.sql

mysql> use sakila;
Database changed
mysql> show tables;


Restore a specific table in the database


mysql> use sakila;
Database changed
mysql> drop table actor;

 Create a dummy database named sakila_dummy and restore the backup of the sakila database on it. Following is the command.

mysql> create database sakila_dummy;
mysql> use sakila_dummy;
mysql> source C:\MySQLBackup\sakila_20200424.sql


Step 2:

Backup the actor table to sakila_dummy_actor_20200424.sql file. Following is the command

C:\Users\Nisarg> mysqldump -u root -p sakila_dummy actor > C:\MySQLBackup\sakila_dummy_actor_20200424.sql




Step 3:

Restore the actor table from the “sakila_dummy_actor_20200424.sql” file. Following is the command on the MySQL command-line tool.

mysql> source C:\MySQLBackup\sakila_dummy_actor_20200424.sql

Execute the following command to verify the table has been restored successfully.

mysql> use sakila;
Database changed
mysql> show tables;











  
==============================
25 at  2021-10-29T15:22:52.000Z
==============================
