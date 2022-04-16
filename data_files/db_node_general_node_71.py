==============================
how to remove ppa ubuntu  
==============================
sudo add-apt-repository --remove ppa:PPA_Name/ppa
example to add ppa : 
sudo apt-add-repository  ppa:maarten-fonville/android-studio
example to remove ppa : 
sudo add-apt-repository --remove ppa:maarten-fonville/android-studio/

Remove a PPA from the source list in the terminal
you can remove the PPA from the sources list where these PPAs are stored. PPA repositories are store in the form of PPA_Name.list.

Use the following command to see all the PPAs added in your system:

ls /etc/apt/sources.list.d

Look for your desire PPA here and then remove the .list file associated with the PPA using the following command:

sudo rm -i /etc/apt/sources.list.d/PPA_Name.list

The -i option with rm command asks before removing a file. Consider this a safety check.

So this is when PPA Purge comes in picture. It not only disables the PPA but also uninstalls all the programs installed by the PPA
 or revert them to original version provided by your distribution.

Install ppa-purge by using the following command:

sudo apt-get install ppa-purge

Now use it in following manner to purge the PPA:

sudo ppa-purge ppa-url
The URL of the PPA can be found in the Software Sources list

Responses from stack  overflow the same 
Use the --remove flag, similar to how the PPA was added:

sudo add-apt-repository --remove ppa:whatever/ppa

You can also remove PPAs by deleting the .list files from /etc/apt/sources.list.d directory.

As a safer alternative, you can install ppa-purge:

sudo apt-get install ppa-purge

And then remove the PPA, downgrading gracefully packages it provided to packages provided by official repositories:

sudo ppa-purge ppa:whatever/ppa

Note that this will uninstall packages provided by the PPA, but not those provided by the official repositories. If you want to remove them, you should tell it to apt:

sudo apt-get purge package_name





  
==============================
71 at  2021-10-29T15:22:52.000Z
==============================
