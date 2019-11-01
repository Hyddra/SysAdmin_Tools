#!/bin/bash

for i in $(cat file1 | grep -d',' -f4); do
    grep $i file2
    echo "find $i on file2"
done
