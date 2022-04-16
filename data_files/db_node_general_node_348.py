==============================
Removes old revisions of snaps CLOSE ALL SNAPS BEFORE RUNNING THIS  
==============================

#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done  
==============================
348 at  2021-10-29T15:22:52.000Z
==============================
