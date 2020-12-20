#!/bin/bash

awk -F ',' 'BEGIN {srand()} {AGE=int((rand()*5+1)+20);; print "insert into register values (" NR ",'\''" $1 "'\'','\''" $2 "'\''," AGE ");"}' peoples.txt | mysql -u root -p1234 peoples


