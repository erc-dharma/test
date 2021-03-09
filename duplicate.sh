#!/bin/sh
dirname=./texts/xml
find $dirname -type f | sed 's_.*/__' | sort|  uniq -d|
while read fileName
do
find $dirname -type f | grep "$fileName"
done

echo "::set-output name=duplicate_filename::$fileName"
