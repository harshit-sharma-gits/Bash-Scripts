#!/bin/bash

release_file=/etc/os-release

if grep -q "Arch" $release_file
then
	# host is based on Arch
	sudo pacman -Syu
fi


if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
	# host is based on Debian / Ubuntu
	sudo apt update
	sudo apt dist-upgrade
fi
