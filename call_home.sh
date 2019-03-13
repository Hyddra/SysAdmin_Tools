#!/bin/bash

timestamp=`date`
home='82.11.186.26'
log='home_report'
echo '--------------------------------' >> $log
echo "|  Calling Home: $home  |" >> $log
echo '--------------------------------' >> $log
echo '' >> $log
echo $timestamp >> $log
ping -c 5 $home | grep 'bytes from' >> $log
