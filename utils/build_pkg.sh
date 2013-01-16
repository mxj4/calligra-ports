#!/bin/bash

[[ -n "$2" ]] || { echo "Usage: build_pkg.sh port_name variants output_dir"; exit 0; }

PREFIX=/opt/calligra
OUTPUT_DIR=${BASH_ARGV[0]}

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

#BUILD_DEPS=`port echo leaves | awk '{print $1}'`
#for dep in $BUILD_DEPS
#do
#    find $OUTPUT_DIR/ -name '${dep}*' -exec rm '{}' \;
#done
#echo "Build deps removed."

