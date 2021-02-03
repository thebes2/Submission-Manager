#!/bin/bash

cfg=./.config
if test -f "$cfg"; then
	source "$cfg"
	scp "$srvp/../submission.zip" ./submission.zip
else
	echo "Server file path not set."
fi
