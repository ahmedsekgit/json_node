==============================
how to git checkout from a specific commit some specific files to a specific directory or another directory   
==============================
1-
sudo git log or  sudo git log --full-history

2-
get the hash for the commit example : e7e8a36a2ffb3b9e73d8ba96d518bce134826444

3-
 s git --work-tree=./../git_checkout/ checkout e7e8a36a2ffb3b9e73d8ba96d518bce134826444 -- .

./../git_checkout is the directory where you want to checkout

the last '.' means current directory if you want you can specify subdir or a file example : 
 s git --work-tree=./../git_checkout/ checkout e7e8a36a2ffb3b9e73d8ba96d518bce134826444 -- controllers/link-controller.js

                      
==============================
344 at  2021-10-29T15:22:52.000Z
==============================
