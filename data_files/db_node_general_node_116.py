==============================
Node.js Port 3000 already in use but it actually isn't?  
==============================
sudo npx kill-port 3000

OR
You can search on how to kill that process.

For Linux/Mac OS search (sudo) run this in the terminal:

$sudo  lsof -i tcp:3000
$ kill -9 PID

On Windows:

netstat -ano | findstr :3000
tskill typeyourPIDhere 

change tskill for taskkill in git bash
  
==============================
116 at  2021-10-29T15:22:52.000Z
==============================
