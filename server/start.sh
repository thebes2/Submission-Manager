#!/bin/bash

source .config

for i in ./submit/*; do
	if test -f "$i"
	then
		ff="${i%.*}--$counter.${i##*.}"
		echo Starting "$ff" with id "$counter"
		mv "$i" "$ff"
		./run.sh "$ff" &
		counter=$((counter+1))
	fi
done

echo counter="$counter" > .config
