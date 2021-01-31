#!/bin/bash

if [ $# -lt 1 ]; then
	exit 1
fi

#############################

MOVE THE EXE TO TMP BEFORE RUNNING







#############################

sn=$(basename "$1")
fp="./tmp/$(basename "$1")"
mv "$1" "$fp"
for i in ./input/*; do
	if test -f "$i"
	then
		echo Running "$sn" on input "$(basename $i)"
		fn=$(basename "$i")
		tf="./tmp/${fn%.*}--${sn%.*}.${fn##*.}"
		./"$fp" < "$i" > "$tf" &
	fi
done

wait # wait for all cases to finish running

# remove executable
rm "$fp"

for i in ./input/*; do
	if test -f "$i"
	then
		# move output files from temporary staging area to output folder
		fn=$(basename "$i")
		tf="./tmp/${fn%.*}--${sn%.*}.${fn##*.}"
		of="./output/${fn%.*}--${sn%.*}.${fn##*.}"
		mv "$tf" "$of"
	fi
done
