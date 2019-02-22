#!/bin/bash

for ip in $(seq 1 50); do
	host 35.205.34.$ip | grep 'vaccoda' | cut -d' ' -f1,5
done
