#!/bin/bash
# Module:   bash_loops.sh
# Purpose:  multiple ways of doing loops in bash
# Date:     10/23/2015
# Notes:
# 1)  http://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
#     http://stackoverflow.com/questions/1469849/how-to-split-one-string-into-multiple-strings-separated-by-at-least-one-space-in
echo "bash_loops.sh - loops in the BASH shell"

echo "Simple loop over list of items"
X="1 2 3 4"
i=0
for x in $X
do 
    echo "  $i \$x=$x"
    ((i++))
done
echo

#arr=(${X// / })

echo "Converting \$X to array based on spaces: arr=(\${X})"
arr=(${X})
echo "  aa=\${arr[0]}"
aa=${arr[0]}
bb=${arr[1]}
cc=${arr[2]}
dd=${arr[3]}
echo "Strings are:  $aa $bb $cc $dd"
echo

echo "Loop over \$arr using:  for x in \"\${arr[@]}\""
i=0
for x in "${arr[@]}"
do
  echo "  x[$i]=$x"
  ((i++))
done

echo
echo "Loop over n strings in \$things=\"one two\""
things="one two"
for one_thing in $things; do
    echo " " $one_thing
done

# -- for zsh:
#for one_thing in ${(z)things}; do
#    echo $one_thing
#done

echo
echo "looping over array:  things=(one two) using \"\${things[@]}\""
things=(one two)
for one_thing in "${things[@]}"; do
    echo $one_thing
done

echo "Done!"


