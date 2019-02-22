#!/bin/bash

# write a bash script to ping a range of ip's
# and inform us which ones reply

for ip in `seq 1 10`; do
	ping -c 1 10.0.0.$ip | grep '64 bytes' | cut -d " " -f 4
done
