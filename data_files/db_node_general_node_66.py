==============================
du -h file / folder / partition to display size of file folder on ubuntu  
==============================

To check the total disk space used by a particular directory, use the -s flag.

du -sh html

Output
260K    html/partials

********************************************   du -h | sort -h  // pour afficher un ordre du petit au plus grand


To find out the size of a directory, the du command is used. du stands for disk usage.
As you can see in the above output, the size of the directories are displayed in a non-readable format. 
So, you use the below command to display in more readable format.

du -h html/
 du -h html
8.0K	html/bashes
24K	html/js/DataTables/DataTables-1.11.2/images
644K	html/js/DataTables/DataTables-1.11.2/js
212K	html/js/DataTables/DataTables-1.11.2/css
884K	html/js/DataTables/DataTables-1.11.2
1.5M	html/js/DataTables
72K	html/js/jquery-ui-1.12.1.custom/images
292K	html/js/jquery-ui-1.12.1.custom/external/jquery
296K	html/js/jquery-ui-1.12.1.custom/external
1.3M	html/js/jquery-ui-1.12.1.custom
52K	html/js/jquery-ui-1.12.1/images
292K	html/js/jquery-ui-1.12.1/external/jquery
296K	html/js/jquery-ui-1.12.1/external
1.3M	html/js/jquery-ui-1.12.1
4.7M	html/js
88K	html/ZipRepo/SQLRepository
24K	html/ZipRepo/autocomplete-master
60K	html/ZipRepo/datatables_colResize
176K	html/ZipRepo
300K	html/history
  
==============================
66 at  2021-10-29T15:22:52.000Z
==============================
