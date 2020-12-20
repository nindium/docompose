#!/bin/bash

readarray -t lnames <lastname.txt
readarray -t fnames <firstname.txt

for i in ${!lnames[@]}; do
	echo "${fnames[$i]},${lnames[$i]}" >> peoples.txt
done


