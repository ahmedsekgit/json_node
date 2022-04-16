==============================
Using mysqldump tool to import export data  
==============================
Dumping table structures

mysqldump -u root -p --no-data mydb > bkp1.sql

Dumping data only

$ mysqldump -uroot -p --no-create-info mydb > bkp2.sql

This command dumps all data from all tables of the mydb databases. It omits the table structures. The omission of the table structures is caused by the --no-create-info option. 
  
==============================
12 at  2021-10-29T15:22:52.000Z
==============================
