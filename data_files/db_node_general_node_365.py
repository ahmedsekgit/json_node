==============================
Can’t connect to local MySQL server through socket                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
==============================

 SQLSTATE[HY000] [2002] Can't connect to local MySQL server through socket
  '/var/run/mysqld/mysqld.sock'

Cleaning the Backyard

sudo apt-get remove --purge mysql*

dpkg -l | grep mysql
you should remove the running *mysql*
sudo apt-get remove --purge mysql-apt-config

sudo rm -rf /etc/mysql /var/lib/mysql
sudo apt-get autoremove
sudo apt-get autoclean

sudo apt update && sudo apt install mysql-server

Now, we want to change some default settings that might not be so secure, then run:

sudo mysql_secure_installation

mysql -u root  -p

mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;
    
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

mysql> FLUSH PRIVILEGES;
    
Now, check if our root user has an authentication_string:

mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;

So for instance, if you locate the file in /data/mysql_datadir/mysql.sock, all you need to do is create a symlink for it using the following command:
	
ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock

may be ... Change MySQL Folder Permission 
sudo chmod -R 755 /var/lib/mysql/
    
    service mysqld start
OR
Multiple MySQL Instances
ps -A|grep mysql
 

Next, kill the mysql process by running this command:
 
sudo pkill mysql
 

Then do the same thing for mysqld:
 
ps -A|grep mysqld
 

Again, kill this process as well:
 
sudo pkill mysqld
 

Finally, go ahead run the following commands to restart and connect to the MySQL server:

sudo service mysql restart
mysql -u root -p

if the problem still there

sudo systemctl start mysql

3. To prevent this issue from happening, set the MySQL service to automatically start at boot:

sudo systemctl enable mysql

Set the MySQL service to automatically start when the system boots up
Method 2: Verify the mysqld.sock Location

The 'Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)' error also happens if MySQL can't find the mysql.sock socket file.

1. Find the current mysqld.sock location by using the find command to list all the socket files on your system:

sudo find / -type s

List all the socket files on your system using the find command

Note: Learn more about this command in our guide for the Linux find command.

2. Open the MySQL configuration file in a text editor of your choice. In this example, we use nano:

sudo nano /etc/mysql/my.cnf

3. Then, add the following lines at the end of the MySQL configuration file:

[mysqld]
socket=[path to mysqld.sock]
[client]
socket=[path to mysqld.sock]

Where:

    [path to mysqld.sock]: Path to the mysqld.sock socket file you found in Step 1.

Edit the MySQL configuration file

Another method is to create a symlink from the location of mysqld.sock to the /var/run/mysqld directory:

ln -s [path to mysqld.sock] /var/run/mysqld/mysqld.sock

4. Press Ctrl+X to close the configuration file and type Y and press Enter to save the changes you made.

Note: Learn how to create symbolic links with our guide to the Linux ln command.

4. Finally, restart the MySQL service:

sudo systemctl restart mysql

                
==============================
365 at  2021-10-31T17:01:13.000Z
==============================
