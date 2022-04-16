==============================
reinstall node js because of problem of mongoose db with the v 10   
==============================
sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/bin/node*
sudo rm -rf /usr/local/include/node*

sudo apt-get purge nodejs npm
sudo apt autoremove
sudo apt-get install nodejs npm  
==============================
89 at  2021-10-29T15:22:52.000Z
==============================
