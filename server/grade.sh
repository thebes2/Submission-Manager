#!/bin/bash

grader="none"

for g in ./grade/*; do
	if test -f "$g"
	then
		grader="$g"
	fi
done

if [ "$grader" = "none" ]; then
	echo "No grader specified"
else
	# commence grading
	for i in ./output/*; do
		if test -f "$i"
		then
			for j in ./output/*; do
				if test -f "$j"
				then
					if [ "$i" != "$j" ]; then
						# lcp=$(printf "%s\n%s\n" "$i" "$j" | sed -e 'N;s/^\(.*\).*\n\1.*$/\1/')
						ba=$(basename "$i")
						bb=$(basename "$j")
						a="${ba%.*}"
						b="${bb%.*}"
						pa=$(echo "$a" | sed 's/--.*//g')
						pb=$(echo "$b" | sed 's/--.*//g')

						if [ "$pa" = "$pb" ]; then
							# the outputs are from the same test case
							# keep the better one
							./"$grader" "$i" "$j"
							res="$?"
							if [[ res -eq "0" ]]; then
								rm "$i"
								break
							else
								rm "$j"
							fi
						fi
					fi
				fi
			done
		fi
	done
fi
