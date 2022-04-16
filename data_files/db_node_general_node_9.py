==============================
dump all data from the database table into a csv file. The FIELDS TERMINATED BY clause controls  
==============================
how to export table to csv in mysql stack overflow

mysql> SELECT * FROM db_test.search INTO OUTFILE '/var/lib/mysql-files/bkp1.csv' FIELDS TERMINATED BY ',';
or for more 
-- If you are using linux,

SELECT id, filename
FROM attachments
INTO OUTFILE '/tmp/results.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
-- and find the csv file /tmp
  
==============================
9 at  2021-10-29T15:22:52.000Z
==============================
