#!/bin/bash

bn=$(basename "$1")
g++ -O2 "$1" -o "./submit/${bn%.*}.out"
rm "$1"