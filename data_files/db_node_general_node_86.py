==============================
install mongodb compass on ubuntu  
==============================
sudo apt-get install curl
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    apt-key list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    sudo apt update
    sudo apt install mongodb-org
Step 2 — Starting the MongoDB Service and Testing the Database
sudo systemctl start mongod.service
sudo systemctl status mongod
sudo systemctl enable mongod
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
{
    "authInfo" : {
        "authenticatedUsers" : [ ],
        "authenticatedUserRoles" : [ ]
    },
    "ok" : 1
}
Ensuite apres avoir fait cela installer mongodb compass deb pour eviter qu il ne repond pas au port 27017
cd Downloads
sudo apt install ./mongodb-compass_1.28.4_amd64.deb 
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

If you want to start Compass from the command terminal then simply type – mongodb-compass and hit 
the Enter key.
Whereas, you can use its shortcut available in the Application launcher.

  
==============================
86 at  2021-10-29T15:22:52.000Z
==============================
