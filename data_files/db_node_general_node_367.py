==============================
split join large gz zip file on ubuntu  
==============================
example folder Arabi_1_.tar.gz
SPLIT
split -b 20M Arabi_1_.tar.gz "Arabi_1_.tar.gz.part"
&&
JOIN
cat Arabi_1_.tar.gz.parta* >backup.tar.gz.joined

                      
==============================
367 at  2022-04-15T15:55:31.594Z
==============================
