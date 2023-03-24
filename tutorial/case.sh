#!/bin/bash

finished=0

while [ $finished -ne 1 ]
do
echo "What is your favourite Linux Distro?"
echo "1 - Arch"
echo "2 - CentOS"
echo "3 - Debian"
echo "4 - Mint"
echo "5 - Ubuntu"
echo "6 - Something else..."
echo "7 - Exit the script"

read distro;

case $distro in
	1) echo "Arch is a rolling release";;
	2) echo "CentOS is popular on servers";;
	3) echo "Debian is a community Distro";;
	4) echo "Mint is popular on Desktops and Laptops";;
	5) echo "Ubuntu is popular on both servers and computers";;
	6) echo "There are many distros out there";;
	7) finished=1;;
	*) echo "You didn't enter an appropriate response"
esac
done

echo "Thanks for using the script"
