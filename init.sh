#!/bin/bash

mkdir -p submit/
mkdir -p input/
mkdir -p output/

echo "counter=0" > .config

watch -n 10 ./start.sh
