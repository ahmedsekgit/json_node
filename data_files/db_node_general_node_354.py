==============================
                      E: Unable to correct problems, you have held broken packages    
==============================

                    

Use aptitude instead of apt-get. It is more intelligent. It not only will handle downgrading conflicting packages for you, but will make a series of recommendations asking you which of many possible suggested working scenarios you would like.

sudo aptitude install myNewPackage

If you don't have aptitude on your machine yet, get it with

sudo apt-get install aptitude

  
==============================
354 at  2021-10-29T15:22:52.000Z
==============================
