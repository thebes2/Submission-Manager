#!/bin/bash

mkdir -p submit/
mkdir -p input/
mkdir -p output/
mkdir -p grade/
mkdir -p tmp/

echo "counter=0" > .config

clear
while true; do
	now=$(date +'%m/%d/%Y %H:%M:%S')
	printf "Curent time: $now\n\n"
	./start.sh &
	./grade.sh && ./accumulate.sh &
	sleep 10
	clear
done
