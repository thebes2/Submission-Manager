#!/bin/bash

cfg=./.config
if test -f "$cfg"; then
	source "$cfg"

	if test -f "$1"; then
		hsh=$(date '+%F %T.%6N' | md5sum) 
		sn="${1%.*}${hsh%???}.${1##*.}" # pray for no collision
		scp "$1" "$srvp$sn"
	else
		echo "File not found."
	fi
else
	echo "Server file path not set."
fi
