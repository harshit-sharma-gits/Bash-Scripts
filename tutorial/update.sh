#!/bin/bash

release_file=/etc/os-release
logfile=./logfile.log
errorlog=./errorlog.log

check_exit_status() {
	if [ $? -ne 0 ]
	then
		echo "An error occured, please check $errorlog file"
	fi
}

if grep -q "Arch" $release_file
then
	# host is based on Arch
	sudo pacman -Syu 1>>$logfile 2>>$errorlog
	check_exit_status
fi


if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
	# host is based on Debian / Ubuntu
	sudo apt update
	check_exit_status

	sudo apt dist-upgrade
	check_exit_status
fi
