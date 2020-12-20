#!/bin/bash

source=$1
counter=0

while IFS= read -r line
do
	let counter=counter+1
	name=($(awk -F "," '{print $1, $2}' <<< $line))
	age=$(shuf -i 20-25 -n 1)
	mysql -u root -p1234 peoples -e "insert into register values ($counter,'${name[0]}','${name[1]}',$age)"
	echo "$counter,${name[0]},${name[1]},$age was correctly inserted"
done < $source


