==============================
export and import XML data using the mysql monitor.   
==============================
mysql -uroot -p --xml -e 'SELECT * FROM mydb.Cars' > /tmp/cars.xml

The mysql monitor has an --xml option, which enables us to dump data in XML format. The -e option executes a statement and quits the monitor. 

mysql> TRUNCATE Cars;

mysql> LOAD XML /tmp/cars.xml INTO TABLE Cars;
We truncate the Cars table. We load data from the XML file. Note that LOAD XML statement is available for MySQL 5.5 and newer
  
==============================
11 at  2021-10-29T15:22:52.000Z
==============================
