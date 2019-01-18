#!/bin/bash
if [ "$@" = "--help" ] || [ "$@" = "-h" ] ; then
	apt-cache --help
else
	# xargs -n3000 for max r1500 lines per printf to avoid going over bash max command length (131072). 1500 lines allows for ~83 charcter per line while dividable by 3 to not accidentally cut of output
	apt-cache search $@ | sort | sed -e "s/\"/'/g" -e 's/^/"/g' -e 's/ - /" "-" "/' -e 's/$/" /g' | xargs -n3000 printf "%-30s %s %s\n" | grep --color=auto -E "$@|$"
fi
