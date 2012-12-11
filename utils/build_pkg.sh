#!/bin/bash

[[ -n "$1" ]] || { echo "Usage: build_pkg.sh port_name variants"; exit 0; }

PORT_SRC=$HOME/Develop/mports/trunk/dports
PREFIX=/opt/calligra
OUTPUT_DIR=$HOME/$1_pkgs

LIST=`port rdeps $@ | sed '1d' | sed 's/^[ ]*//g'`" $1"
echo $LIST

rm -r $PREFIX/var/macports/build/*
echo "Macports build dir cleaned"

for component in $LIST
do
	port -v pkg $component
done
echo "All components built."

find $PREFIX/var/macports/build -name '*-component.pkg' -exec mv '{}' $OUTPUT_DIR/ \;
echo "All component pkgs moved to $OUTPUTDIR."
