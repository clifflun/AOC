#!/bin/bash

##Part1
cat input.txt| grep -viE "[1-9][3-9] red|[1-9][4-9] green| [1-9][5-9] blue" |grep -v -E "[2-9]0 [red|green|blue]"| cut -d ":" -f1 |cut -d " " -f 2 | awk '{s+=$1} END {print s}'


## Part2



< input.txt grep -onE "([0-9]+) red" | sed 's/red//g' | sed 's/:/\t/g' |sort -k2,2gr | sort -k1,1 -u | cut -f 2 > red
< input.txt grep -onE "([0-9]+) red" | sed 's/red//g' | sed 's/:/\t/g' |sort -k2,2gr | sort -k1,1 -u | cut -f 2 > red
< input.txt grep -onE "([0-9]+) blue" | sed 's/blue//g' | sed 's/:/\t/g' |sort -k2,2gr | sort -k1,1 -u | cut -f 2 > blue
< input.txt grep -onE "([0-9]+) green" | sed 's/green//g' | sed 's/:/\t/g' |sort -k2,2gr | sort -k1,1 -u | cut -f 2 > green
paste red blue green |awk '{p=$1*$2*$3} {print p}' | awk '{s+=$1} END {print s;}'

