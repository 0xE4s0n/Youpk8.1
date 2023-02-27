#!/bin/bash

for sfile in `find . \( -path ./.git -o -path ./backup -o -path ./backup.sh -o -path ./overwrite.sh \) \
    -prune -o -type f -print`
do
    sfile_path=${sfile%/*} # './abc' or '.'
    file_path=${sfile_path#*.} # '/abc' or ''
    file_name=${sfile##*/} # 'adb.txt'
    if [ ! -d ./backup$file_path ] && [ -d ../aosp$file_path ]
    then
        (set -x;mkdir -p ./backup$file_path)
    fi
    if [ -d ../aosp$file_path ] && [ ! -f ./backup$file_path/$file_name ]
    then
        (set -x;cp ../aosp$file_path/$file_name ./backup$file_path/$file_name)
    fi
done
