#!/bin/bash

if [ $# -lt 1 ]; then
	exit 1
fi

sn=$(basename "$1")
for i in ./input/*; do
	if test -f "$i"
	then
		echo Running "$sn" on input "$i"
		fn=$(basename "$i")
		tf="./tmp/${fn%.*}--${sn%.*}.${fn##*.}"
		./"$1" < "$i" > "$tf" &
	fi
done

wait # wait for all cases to finish running

for i in ./input/*; do
	if test -f "$i"
	then
		rm "$1"
		fn=$(basename "$i")
		tf="./tmp/${fn%.*}--${sn%.*}.${fn##*.}"
		of="./output/${fn%.*}--${sn%.*}.${fn##*.}"
		mv "$tf" "$of"
	fi
done
