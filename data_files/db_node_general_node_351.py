==============================
 Reset MySQL root password using ALTER USER statement                                                                              
==============================
Soit:
If you started mysql using mysql -u root -p

Try ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
    
    
    

Soit:

 mysql> UPDATE mysql.user SET Password=PASSWORD('your_new_password')
           WHERE User='root';
    
    
     


                    
                    
                      
==============================
351 at  2021-10-29T15:22:52.000Z
==============================
