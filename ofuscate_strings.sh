#!/bin/bash

file="testing.txt"

sed -e 's/^\(....\)......../\1********/' $file
