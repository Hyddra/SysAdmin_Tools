#!/bin/bash


# Get all the PID's
pid=$(cat test.pid)

# Trap them in a temp file
tmp_pid="/tmp/temp_pids.pid"
catcher=$(pgrep -f running.py >> $tmp_pid)

# how many processes are runnin?
count=$(cat $tmp_pid | wc -l)


# Define Invaders
find_invaders()
{
		echo "WARNING!!!"
		echo "Invaders Detected.."
		purge_invaders
}

# Get rid of the alien ones
purge_invaders()
{
		sleep 1
		while read line;
		do
				if [[ $line -ne $pid ]]; then
						echo "Purging impostor $line"
						kill $line
						fi
		done < "$tmp_pid"
}

# This is where the magic happens.
if [ $count -gt 1 ]; then
		find_invaders
else
		echo "No invaders detected.."
		rm "$tmp_pid"
		exit 0
fi
