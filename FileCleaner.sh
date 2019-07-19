#!/usr/bin/env bash

# Description: Remove old files from
# Author: Hyddra

timestamp=$(date +%Y+%m+%d_%H:%M)
path="/tmp"
dry_run=false

# Log the cleaning
log_path="$HOME/Git/tools/testing_scripts"
log="$log_path/run.out"

# Useful help text
display_usage()
{
    cat <<USAGE| expand -t4

Usage: 
 $0 [OPTION]...
Removes files older than the pre-defined age period.
The age to retain is assigned to the age variable

Mandatory arguments is one of the below:
    -h		    This help text
    -n		    Dry run, used for testing to prevent deleting files by mistake
    -r		    Execute the real deletion of the files

Examples:

    - $0 -h	    Display the help menu	
    - $0 -n	    Performs a dry run of the script, echoing in stdout the files to be deleted if "-r" flag is passed

USAGE

}

main()
{
	echo "Start time $(date)"
	local action="$*"
	if $dry_run; then 
	    echo "======================================="
	    echo "DRY RUN - Not Removing files"
	    echo "======================================="; fi
	for i in *; do
		echo "===== $i ====="
		find $path -name .snapshot -prune -o -type f -path "*/DONE/*" -mtime +1825 $action
	done
	echo "Finish time $(date)"
}

# Check log file exists, and create if not

if [[ ! -f $log ]]; then
    touch $log
    exit 0
fi

if [[ -z "$1" ]]; then
    echo "$0 [ option ]"
    echo "Example use: \
	$0 -h"
    exit 1
fi
	
while getopts ":hnr" option; do
    case $option in
	h) display_usage
	    ;;
	n) # dry_run xD
	    dry_run=true
	    main -print >> $log
	    ;;
	r) echo "=======================================" >> $log
	   echo " Removing old files" >> $log	
	   echo "=======================================" >> $log
	   main -print -delete >> $log
	    ;;
	*) echo "Invalid option..."
	    display_usage
	    ;;
    esac
done

