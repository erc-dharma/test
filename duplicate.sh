#!/bin/sh
dirname=./texts/xml
find $dirname -type f | sed 's_.*/__' | sort|  uniq -d|
while read fileName
do
if [ -n $(find $dirname -type f | grep "$fileName")]; then echo ::set-output name=duplicate_filename::$(find $dirname -type f | grep "$fileName");
fi;
done
