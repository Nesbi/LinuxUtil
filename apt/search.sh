#!/bin/bash
if [ "$@" = "--help" ] || [ "$@" = "-h" ] ; then
	apt-cache --help
else
	apt-cache search $@ | sed -e 's/^/"/g' -e 's/ - /" "-" "/' -e 's/$/" /g' | tr -d '\n' | xargs printf "%-30s %s %s\n" | grep --color -E "$@|$"
fi
