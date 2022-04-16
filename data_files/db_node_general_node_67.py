==============================
How To Set Up Apache Virtual Hosts on Ubuntu 18.04/20.04 works  
==============================
sudo apt update
sudo apt install apache2

Step One — Create the Directory Structure
sudo mkdir -p /var/www/example.com/public_html
sudo mkdir -p /var/www/test.com/public_html

Step Two — Grant Permissions
sudo chown -R $USER:$USER /var/www/example.com/public_html
sudo chown -R $USER:$USER /var/www/test.com/public_html

sudo chmod -R 755 /var/www

Step Three — Create Demo Pages for Each Virtual Host


nano /var/www/example.com/public_html/index.html

/var/www/example.com/public_html/index.html

<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success! The example.com virtual host is working!</h1>
  </body>
</html>

cp /var/www/example.com/public_html/index.html /var/www/test.com/public_html/index.html
nano /var/www/test.com/public_html/index.html
/var/www/test.com/public_html/index.html

<html>
  <head>
    <title>Welcome to Test.com!</title>
  </head>
  <body> <h1>Success! The test.com virtual host is working!</h1>
  </body>
</html>
Step Four — Create New Virtual Host Files
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/example.com.conf
sudo nano /etc/apache2/sites-available/example.com.conf
<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
sudo cp /etc/apache2/sites-available/example.com.conf /etc/apache2/sites-available/test.com.conf
sudo nano /etc/apache2/sites-available/test.com.conf
<VirtualHost *:80>
    ServerAdmin admin@test.com
    ServerName test.com
    ServerAlias www.test.com
    DocumentRoot /var/www/test.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
Step Five — Enable the New Virtual Host Files
    sudo a2ensite example.com.conf
    sudo a2ensite test.com.conf
Next, disable the default site defined in 000-default.conf:

    sudo a2dissite 000-default.conf
sudo systemctl restart apache2
sudo systemctl status apache2
Step Six — Set Up Local Hosts File (Optional)
    sudo nano /etc/hosts
127.0.0.1   localhost
127.0.1.1   guest-desktop
your_server_IP example.com
your_server_IP test.com
Step Seven — Test your Results
http://example.com
http://test.com







  
==============================
67 at  2021-10-29T15:22:52.000Z
==============================
