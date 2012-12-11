#!/bin/bash

[[ -n "$1" ]] || { echo "Usage: fork_macports.sh port_name variants"; exit 0; }

PORT_SRC=$HOME/Develop/mports/trunk/dports

LIST=`port rdeps $@ | sed '1d' | sed 's/^[ ]*//g'`" $1"
echo $LIST

mkdir ports_fork
rm -r ports_fork/*

for pkg in $LIST
do
	echo "Finding $pkg ..."
	for search_dir in `find $PORT_SRC -type d -depth 1`
	do
		port_dir=`find $search_dir -name $pkg -type d -depth 1`
		if [ "$port_dir" != "" ]
		then
			echo "Copying $pkg ..."
			ditto $port_dir ports_fork/${search_dir##*/}/$pkg
			break
		fi
	done
done

echo "Copying _resources..."
ditto $PORT_SRC/_resources ports_fork/_resources

echo "Done."
