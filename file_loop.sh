#!/bin/bash
# Module:   bash_math.sh
# Purpose:  sample math in Bash using multiple means
# Date:     10/23/2015
# Notes:
# 1) Ref:  n/a
#
# get list of files, change suffix of file name
#    abc.sh becomes abc.xxx
#
echo "file_loop.sh:  loop and touch files, change suffixes"
cnt=1
for file in *.sh
  do touch "${file/%sh/xxx}"; done

  # or expand:
for file in *.sh; do
    ((cnt++))
    touch "${file/%sh/yyy}"
  done

echo "Num files=" $cnt
