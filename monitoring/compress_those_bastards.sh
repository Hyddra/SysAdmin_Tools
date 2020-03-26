#!/bin/bash

# ================================================================
# Title             : <need a cool name>
# Descripion        : Compresses files older than +365 days 
# Author            : 
# Date              : 2020-03-26
# Revision / QA     : 
# Version           : 1.0
# Usage             : bash <script.sh>
# Bash_Version      : 3.2.25(1)-release 
# ================================================================

# We are hard-coding a list with the worst offenders ( last update - 2020/03/26 )

deposit="/tmp/"

if [[ $(pwd) != $deposit ]]; then cd $deposit; fi

echo -e "\nThese are the directories currently hard-coded:"
for i in ${directories[@]}; do echo $i; done
echo -e "\nTotal size BEFORE compression: \n"

# Main logic

for dir in $deposit/*; do
    echo "$(du -s $dir)"
done

echo -e "\nTotal size AFTER compression: \n"

for dir in $deposit/*; do
    #find $dir ! -name "*.gz" -mtime +365 -type f -exec gzip {} \;
    find $dir ! -name "*.gz" -mtime +365 -type f -exec gzip {} \;
    echo "$(du -s $dir)"
done

