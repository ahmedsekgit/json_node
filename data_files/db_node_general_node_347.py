==============================
Best Clean ubuntu recommandations and instructions                                                                          
==============================


    Show top 10 biggest subdirs in the current dir.

     du -sk * | sort -nr | head -10

    Use File Usage Analyzer (AKA baobab;
     GNOME based), Filelight or kDirStat (KDE based), to see where the disk space is going visually (ncdu uses a TUI).

    Check if you have old kernels for deletion

     ls -lh /boot

    Cleaning packages

     sudo apt autoremove
     sudo apt autoclean

    see list of all installed packages, sorted by size. If you see something big and don't use it - uninstall it

     dpkg-query -W --showformat='${Installed-Size} ${Package}\n' | sort -nr | less

    Clean unused language files with translations (there are tons of them)

     sudo apt install localepurge

    Check content of /var/tmp/

     du -sh /var/tmp/

    Check also

     man deborphan

    Search for big files:

     find / -type f -size +1024k

    or

     find / -size +50000  -exec ls -lahg {} \;
    

    Big installed packages (part of the package: debian-goodies)

     dpigs

    or wajig sizes | tail -30.

    On systemd: Remove the oldest archived journal files until the disk space they use falls below the specified size

     sudo journalctl --vacuum-size 10M

    Limit Tracker disk usage.


You can "pause" the Gnome Tracker by setting the configuration option org.freedesktop.Tracker.Miner.Files.low-disk-space-limit used by tracker-miner-fs.

Values indicate if we pause indexing at a percentage of low disk space (0-100% or -1 to disable the check entirely, 3 being the default value).

Open a terminal (Ctrl+Alt+t) and type the following command to stop the tracker at 1%:

gsettings set org.freedesktop.Tracker.Miner.Files low-disk-space-limit 1



                      
==============================
347 at  2021-10-29T15:22:52.000Z
==============================
