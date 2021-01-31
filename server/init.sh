#!/bin/bash

mkdir -p submit/
mkdir -p input/
mkdir -p output/
mkdir -p grade/
mkdir -p tmp/

echo "counter=0" > .config

clear
while true; do
	printf "%0.s=" $(seq 1 $COLUMNS)
	./start.sh &
	./grade.sh &
	sleep 10
	clear
done
