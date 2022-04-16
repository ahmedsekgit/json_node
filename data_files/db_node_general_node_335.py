==============================
How To Find Files Modified In The Last N Days Or Minutes Using find  
==============================
To find the files that have been changed (with the files data modification time older than) in the last N days from a directory and subdirectories, use:

find /directory/path/ -mtime -N -ls

    Find all files modified in the last day (24 hours; between now and a day ago) in a directory and subdirectories:

find /directory/path/ -mtime -1 -ls

-mtime -1 is the same as -mtime 0.

    Find all files modified in the last 30 days:

find /directory/path/ -mtime -30 -ls

But what if you need to find the files that have a modification date older than N, for example older than 30 days? In that case you need to use +N instead of -N, like this:

find /directory/path/ -mtime +N -ls

Examples:

    Find all files with a modification date older than 7 days:

find /directory/path/ -mtime +7 -ls

    Find all files modified more than 48 hours ago (at least 2 days ago):

find /directory/path/ -mtime +1 -ls

    Find all files modified between 24 and 48 hours ago (between 1 and 2 days ago):

find /directory/path/ -mtime 1 -ls

So why is 1 one day ago, and +1 older than 2 days / 48 hours ago? That's because according to the man find, any fractional parts are ignored, so if a file was last modified 1 day and 23 hours ago, -mtime +1 won't match it, treating it as if the file was last modified 1 day, 0 hours, 0 minutes, and 0 seconds ago; see this explanation on why that's the case

his being the case, how can you get all files modified at least 1 day ago? Use +0:

find /directory/path/ -mtime +0 -ls


Using minutes instead of days

To find the files that have been modified N minutes ago, or with a modification date older than N, simply replace -mtime with -mmin.

So if you want to find the files that have been changed (with the files data modification time older than) in the last N minutes from a directory and subdirectories, use:

find /directory/path/ -mmin N -ls

Examples:

    Find all files modified in the last 5 minutes in a directory and subdirectories:

find /directory/path/ -mmin -5 -ls

    Find all files with a modification date older than 5 minutes:

find /directory/path/ -mmin +5 -ls
  
==============================
335 at  2021-10-29T15:22:52.000Z
==============================
