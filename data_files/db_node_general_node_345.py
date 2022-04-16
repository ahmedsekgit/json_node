==============================
[nodemon]    ENOSPC: System limit for number of file watchers reached  
==============================
Solution from stackoverflow :

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p  
==============================
345 at  2021-10-29T15:22:52.000Z
==============================
