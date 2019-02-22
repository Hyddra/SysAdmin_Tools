#!/bin/bash

for name in $(cat list.txt); do
	host $name.awjit.co.uk | grep "has address" | cut -d" " -f1,4
done

# the idea behind this technique is to guess the present and funcionality
# of the server if the domain name exists

