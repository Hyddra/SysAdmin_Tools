#!/usr/bin/env bash

# Description: Remove old files from
# Author: Hyddra

############ TO DO ###################
# Add dry run - 
# Improve usage to look professional
#
######################################


# General Vars
timestamp=$(date +%Y+%m+%d_%H:%M)
path="/tmp/"
action="-print -delete"
dry_run=false

# Log the cleaning
log_path="$HOME/Git/tools/testing_scripts"
log="$log_path/run.out"

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
	if $dry_run; then 
	    echo "======================================="
	    echo "DRY RUN - Not Removing files"
	    echo "======================================="; fi
	find $path -mindepth 2 -type f -mtime +1 $action
	echo "Finish time $(date)"
}

# Check the existance of the log file
# If non-existent, create it

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

	n) # dry_run
	    dry_run=true
	    action="-print"
	    main >> $log
	    ;;

	r) echo "=======================================" >> $log
	   echo " Removing old files" >> $log	
	   echo "=======================================" >> $log
	   main >> $log
	    ;;

	*) echo "Invalid option..."
	    display_usage
	    ;;
    esac
done

