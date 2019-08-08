#!/bin/bash

# Author: Hyddra
#
# Description: This script was made to address a specific challenge on 
# the attackdefense.com labs, and it's meant to crack the password
# from an encrypted pdf file.
# 
# The format of the password is provided as a means to speed up
# the cracking process to avoid overloading the lab servers
# and this is made in bash instead of using crunch exactly for
# the same reason.

for day in {1..31}; do
    for month in {1..12}; do
	for year in {1974..1985}; do
	    echo "$day$month$year""D" >> passwords.txt
	done
    done
done


# now to convert the pdf to text and opent the file to retrieve the flag
pdftotext -upw <password> encrypted.pdf
cat encrypted.txt
echo "===================================="
echo -e "\t\t Success"
echo "===================================="
