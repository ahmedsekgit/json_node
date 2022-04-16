==============================
check if a port is occupied  because mongodb cant connect to   
==============================
sudo apt install net-tools
netstat -tulpn | grep LISTEN
after that 
This happened probably because the MongoDB service isn't started. Follow the below steps to start it:

    Go to Control Panel and click on Administrative Tools.
    Double click on Services. A new window opens up.
    Search MongoDB.exe. Right click on it and select Start.

The server will start. Now execute npm start again and the code might work this time.

For windows - just go to Mongodb folder (ex : C:\ProgramFiles\MongoDB\Server\3.4\bin)
 and open cmd in the folder and type "mongod.exe --dbpath c:\data\db"

if c:\data\db folder doesn't exist then create it by yourself and run above command again.

All should work fine by now.))


  
==============================
87 at  2021-10-29T15:22:52.000Z
==============================
