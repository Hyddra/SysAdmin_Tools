#!/bin/bash

hosts=`cat internal_servers`
timestamp=`date`
log='areyoualive.log'

for host in $hosts; do
	echo "Checking internal hosts"
	ping -c 3 $host | grep 'bytes from' >> $log
done

# cat $log | grep -v 'bytes from'

