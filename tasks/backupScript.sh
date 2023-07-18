#!/bin/bash

######################################################################################
##             WRITTEN BY - HARSHIT SHARMA <harshits908@gmail.com>                  ##
## This script is going to montior a directory and backup it whenever any change    ##
## is made to this directory.                                                       ##
## Two tools are used here:                                                         ##
## inotifywait (A handy utility for monitoring the folder for any event)            ##
## rsync (A utility to copy files to another location, backup basically)            ##
## BEFORE USING THIS SCRIPT MAKE SURE YOU HAVE BOTH THESE UTILITIES INSTALLED       ##
######################################################################################

# Provide the paths here for your use-case
originDir="/path/to/the/watched/directory/"
destinationDir="/path/to/the/destination/directory/"
logfile="/path/to/your/logfile"

# Watching the Directory using inotifywatch
inotifywait -m -r -e modify,create,delete,move "$originDir" |
while read path action file; do

        # Trigger - Change Detected
        currentTime=$(date +"%T")
        echo "Change detected in the database @ $currentTime , Making a backup!" >> "$logfile"

        # Taking the backup
        rsync -avz $originDir $destinationDir --delete >> "$logfile"

        echo "Backup Complete!" >> "$logfile"

done
