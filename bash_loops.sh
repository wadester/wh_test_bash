#!/bin/bash
# Module:   bash_loops.sh
# Purpose:  multiple ways of doing loops in bash
# Date:     N/A
# Notes:
# 1)  http://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
#     http://stackoverflow.com/questions/1469849/how-to-split-one-string-into-multiple-strings-separated-by-at-least-one-space-in
#     http://www.cyberciti.biz/faq/bash-for-loop/

# 2)  Most of this will NOT work on busybox's shell
#
echo "bash_loops.sh - loops in the BASH shell"

echo "Simple loop over list of items (works w/ busybox)"
X="1 2 3 4"
i=0
for x in $X
do 
    echo "  $i \$x=$x"
    ((i++))
done
echo

echo "Simple loop with values supplied (1 1 2 3 5 8 13) (works w/ busybox)"
i=0 
for x in 1 1 2 3 5 8 13
do
    echo "  $i \$x=$x"
    ((i++))
done

echo "Simple loop with values supplied by {1..3} (not w/ busybox)"
i=0 
for x in {1..3}
do
    echo "  $i \$x=$x"
    ((i++))
done

echo "Simple loop using seq 1 2 4 (works w/ busybox)"
# -- busybox test:  
#    for x in $(seq 1 2 4); do echo "x=$x"; done
# seq LAST -> 1..LAST; seq FIRST LAST; seq FIRST INC LAST
i=0 
for x in $(seq 1 2 4)
do
    echo "  $i \$x=$x"
    ((i++))
done

echo "seq with floating format, see man seq"
for x in $(seq --format="%010.2f" 10)
do
    echo "X=$x"
done

echo "Simple FOR loop (not w/ busybox)"
i=0 
for (( x=1; x<=5; x++ ))
do
   echo "  $i \$x=$x"
   ((i++)) 
done


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
echo "Loop over n strings in \$things=\"one two\" (works w/ busybox)"
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


echo "Example of inf loop using while [ 1 ]"
echo "  - uses counter \$ii=1 and \"break\" when ii>5"
echo "  - does not work w/ busybox"
ii=1
while [ 1 ]; do
    printf "%03d Message...\n" $ii
    ((ii++))
    if ((ii>5)); then
	break
    fi
    # sleep for N seconds, float value accepted
    sleep .3
done
LIMIT=10

echo "C-style loop:  for ((a=1; a <= LIMIT ; a++))"
LIMIT=10
for ((a=1; a <= LIMIT ; a++))
do
  echo -n "$a "
done
echo

echo "Done!"


