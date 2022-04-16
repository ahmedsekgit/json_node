==============================
            mongodb install ubuntu 20.04 shell by Adorable Alpaca on May 02 2021 Comment 0                                                               
==============================
FOR WSL2

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

sudo apt-get update
sudo apt-get install -y mongodb-org

sudo nano /etc/init.d/mongod
paste this content in the file 'https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d'

#give permissions
sudo chmod +x /etc/init.d/mongod

#start the service
sudo service mongod start
                    
in case you can

Steps to install MongoDB Community Edition on Ubuntu 16.04

Run these commands in Terminal (Ctrl + Alt + T):

To remove an already installed MongoDB

    sudo apt-get purge mongodb-org*

    sudo rm -r /var/log/mongodb
    sudo rm -r /var/lib/mongodb

Then start installing with the following commands:

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

    sudo apt-get update

    sudo apt-get install -y mongodb-org

To start MongoDB run:

sudo service mongod start


to remove it sudo dpkg --remove mongodb-compass-community

                    
                      
==============================
353 at  2021-10-29T15:22:52.000Z
==============================
