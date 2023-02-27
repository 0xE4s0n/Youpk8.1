#!/bin/bash

for sfile in `find . \( -path ./.git -o -path ./backup -o -path ./backup.sh -o -path ./overwrite.sh \) \
    -prune -o -type f -print`
do
    sfile_path=${sfile%/*} # './abc' or '.'
    file_path=${sfile_path#*.} # '/abc' or ''
    file_name=${sfile##*/} # 'adb.txt'
    if [ ! -d ../aosp$file_path ];then
        (set -x;mkdir ../aosp$file_path)
    fi
    (set -x;cp $sfile_path/$file_name ../aosp$file_path/$file_name)
done
