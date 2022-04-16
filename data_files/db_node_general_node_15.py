==============================
How should I tackle --secure-file-priv in MySQL?  
==============================
t's working as intended. Your MySQL server has been started with --secure-file-priv option which basically limits from which directories you can load files using LOAD DATA INFILE.

You may use SHOW VARIABLES LIKE "secure_file_priv"; to see the directory that has been configured.

You have two options:

    Move your file to the directory specified by secure-file-priv.
    Disable secure-file-priv. This must be removed from startup and cannot be modified dynamically. To do this check your MySQL start up parameters (depending on platform) and my.ini.

SHOW VARIABLES LIKE "secure_file_priv";
+------------------+-----------------------+
| Variable_name    | Value                 |
+------------------+-----------------------+
| secure_file_priv | /var/lib/mysql-files/ |
+------------------+-----------------------+


  
==============================
15 at  2021-10-29T15:22:52.000Z
==============================
