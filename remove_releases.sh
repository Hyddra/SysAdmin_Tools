#!/usr/bin/env bash

# I want to be able to remove releases

# What does this have to do?
# Connect to every server in the estate
# Find out the release currently in use
# Get a retain period with the number of releases to keep
# delete everything older than the defined releases


### Vars
servers="/opt/file/hostlist"
release_directory="/opt/ims/packages"
release_current="/opt/ims/release/<llast_release>"


# Email

mailx -r "imsroot@ukdc1-pm-isa01.worldpay.local" -s "remove old releases report" dl-wpg24-7@worldpay.com


# Where am I getting the list of the packages to delete?

release_directory = ''

# Connect to server and change to proper directory

getOldReleases() {

    ssh $user@servers.mgt cd $release_directory

}
