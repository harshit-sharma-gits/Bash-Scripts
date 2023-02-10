#!/bin/bash

filePath="$(pwd)/myfile"

echo "Checking for $filePath"

if [ -f $filePath ]
then
	echo "The file exists."
else
	echo "The file does not exists."
fi
