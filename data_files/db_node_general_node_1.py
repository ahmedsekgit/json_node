==============================
Comment créer un nouvel utilisateur et octroyer des autorisations dans MySQL                          
==============================
sudo mysql -uroot -p CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
    
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
     FLUSH PRIVILEGES;
    
                      
==============================
1 at  2021-10-29T15:22:52.000Z
==============================
