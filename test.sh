#!/bin/bash

cd /tmp/
for i in * .*;
do
		if [ "$i" != "." -a "$i" != ".." ];
		then
			echo "handling $i"
		fi
done
