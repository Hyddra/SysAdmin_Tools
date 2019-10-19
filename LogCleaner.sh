#!/bin/bash
#
# Author: Hyddra
# Description: Purge Log Files
# Implementation: Somewhere over the Rainbow

path="/opt/ims/live/logs"
timestamp=$(date +%Y-%m-%d_%H:%M:%S)
filename="Purged_$timestamp.log"
log_path="$path/purged_logs"
log="$log_path/$filename"
action="-print -delete"
retention=0
log_retention=31
dryrun=false

while getopts "nr:" OPT; do
    case "$OPT" in
	n) # dry run
	    dryrun=true
	    action="-print"
	    ;;
	r) retention=$OPTARG
	    ;;
    esac
done
shift $((OPTIND-1))

# Functions

purge()
{
    find $path -min +$retention $action
}

clean_up()
{
    gzip $log
    find $log_path -type f -mtime +$log_retention $action
}

main()
{
    timestamp=$(date +%Y-%m-%d_%H:%M:%)
    echo "### Starting Purge ### $timestamp " >> $log
    if $dryrun; then echo "DRY RUN - not deleting anything" | tee -a $log; fi
    purge >> $log
    timestamp=$(date +%Y-%m-%d_%H:%M:%)
    echo -e "\n### Purge Finished ### $timestamp" >> $log
    clean_up >> $log
}

main


