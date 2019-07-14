#!/bin/bash

cat example.csv | cut -d, -f 9 >> example_test.csv
sed -e 's/^\(...\)...../\1********/' example_test.csv >> example_filter.csv
paste -d, example.csv example_filter.csv

