#!/bin/bash

nmap -sT 10.0.0.1/24 -p 5000 > /dev/null -oG openports.txt

cat openports.txt | grep -i open > open.txt

