#!/bin/bash

# In this sccript we are going to use the absolute paths for the commands
# Because when a job runs via CRON, it does not run in the same shell
# environment. So it might not have the PATH variable there. 

/bin/mkdir -p /home/martyr/logfiles/

# Here is the destination file

destination_log="/home/martyr/logfiles/server.log"
activity_log="/home/martyr/logfiles/activity.log"

# Fetching the user log for `martyr` and storing it in the destination logfile

/bin/loginctl user-status martyr > "$destination_log"

currentTime=$(/bin/date +"%d-%m-%y: %T")
/bin/echo "Updated server.log at $currentTime" >> "$activity_log"

# Now this script is going to run from CRON
# We schedule this task by adding */3 * * * * /home/martyr/scripts/startupscript.sh
# To the crontab
