#!/bin/bash

# ================================================================
# Title             : shrinker.sh
# Descripion        : Compresses files older than 365 days 
# Author            : Hyddra
# Date              : 2020/03/26
# Version           : 1.1
# Usage             : bash shrinker.sh
# Bash_Version      : 5.0.11(1)-release
# ================================================================

# We are hard-coding a list with the worst offenders ( last update - 2020/03/26 )

deposit="/tmp"
directories=("home" "mnt" "opt" "usr" "var")

if [[ $(pwd) != $deposit ]]; then cd $deposit; fi


echo -e "\nAs of $(date +%Y/%m/%d), the worst offenders are: "
# Sure, smartly expand the list but don't validate if the list is still accurate... :)

for i in ${directories[@]}; do echo $i; done

echo -e "\nTotal size BEFORE compression: \n"

# Main logic
for dir in $deposit/*; do
    echo "$(du -s $dir)"
done

echo -e "\nTotal size AFTER compression: \n"

for dir in $deposit/*; do
    find $dir ! -name "*.gz" -mtime +365 -type f -exec gzip {} \;
    echo "$(du -s $dir)"
done

