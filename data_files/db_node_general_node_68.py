==============================
chown et chmod les mieux adaptes   
==============================
la variable $USER prend l utilisateur actuel dans mon cas "sea"
sudo chown -R $USER:$USER /var/www/
sudo chmod -R 755 /var/www/

linux external hard drive chmod
 sudo chmod    ugo+wx    /media/username/your_drive

change permissions for specific file types linux 
find . -name "*.sh" -exec chmod +x {} \;

chmod ax
chmod a+x filename
chmod   -R   u=rwx,go=rx    /tofile_path
chmod   -R   u=rwx,go=wx    /tofile_path

chmod: changing permissions of : Read-only file system and writeable
sudo mount -o remount,rw '/media/username/drivename'
sudo chmod ugo+wx /media/username/drive name

chmod add execute permission to useer
sudo chmod u+x <filename>

ls display chmod number
stat -c '%a %n' *

chmod: Unable to change file mode Operation not permitted
 sudo chmod -R +rwX .



chmod using find in bash
find /target-folder -type d -exec chmod 0755 {} \;
find /target-folder -type f -exec chmod 0644 {} \;

chmod just directories
find /path/to/base/dir -type d -exec chmod 755 {} +
    
==============================
68 at  2021-10-29T15:22:52.000Z
==============================
