#!/bin/bash

mkdir -p submit/
mkdir -p input/
mkdir -p output/
mkdir -p grade/

echo "counter=0" > .config

watch -n 10 "./start.sh & ./grade.sh"
