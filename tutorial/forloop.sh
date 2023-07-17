#!/bin/bash

for curr_no in {1..10}
do
	echo $curr_no
	sleep 0.7
done

echo "We are outside the for loop"
echo "One more type of for loop:"

for ((i=0 ;i<10 ;i++))
do
	echo $i
 	sleep 0.3
done
