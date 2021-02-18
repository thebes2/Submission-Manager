#!/bin/bash

source .config

for i in ./submit/*; do
	if test -f "$i"
	then
		ext="${i##*.}"
		if [ "$ext" = "cpp" ]; then
			bn=$(basename "$i")
			mv "$i" "./tmp/$bn"
			echo Compiling "$i"
			./compile.sh "./tmp/$bn" &
			echo $! >> .runtime
		else
			ff="${i%.*}--$counter.${i##*.}"
			echo Starting "$ff" with id "$counter"
			mv "$i" "$ff"
			./run.sh "$ff" &
			echo $! >> .runtime
			counter=$((counter+1))
		fi
	fi
done

echo counter="$counter" > .config
