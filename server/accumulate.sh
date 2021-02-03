#!/bin/bash

declare -A mp
declare -a fl

for i in ./output/*; do
	if test -f "$i"
	then
		nn=$(echo "$i" | sed 's/--.*\././g')
		if [ "$nn" != "$i" ]; then
			mp[$i]="$nn"
			fl+=("$nn")
		fi
	fi
done

for key in "${!mp[@]}" 
do
	val="${mp[$key]}"
	mv "$key" "$val"
done

if [ ${#mp[@]} -gt 0 ]; then
	# Only produce new zip if output files have changed
	if test -f submission.zip; then rm submission.zip ; fi
	cd ./output
	ls | zip -@ ../submission.zip > /dev/null
	cd ..
fi
