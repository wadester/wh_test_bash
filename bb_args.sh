#!/bin/busybox sh
# Module:   bb_args.sh
# Purpose:  arg processing for busybox shell
# Date:     10/28/2015
# Notes:
# 1) https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
#

echo "bb_bash_args.sh:  Shell args and special chars -- for busybox sh"

if [ $# -eq 0 ]
then
    echo "This works better with some args passed here"
    echo "Usage:  ./bash_args.sh arg1 arg2 a b c d etc. "
else
    i=0
    j=$#
    echo "Listing the args (cnt=$j):"
    while [ $i -lt $j ]; do
	echo "ARG[$i] = $1"
	shift 1
	let "i++"
    done
fi

echo "Script name is \$0:  $0"

# -- BB does not support this
echo "NOT SUPPORTED:  Using a BASH array assigned via (\"\$@\"): "
#args=("$@")
echo "Count of args=$#"
echo "First arg=$1"
#echo "First arg=${args[0]}"

#i=0
#for x in "${args[@]}"; do
#    echo "ARG[$i] = $x"
#    ((i++))
#done
echo "Passing args to a sub-shell"
busybox sh -c 'echo $$ $# $0 $1 $2' arg1 arg2 arg3



# $* is positional parms
# $@ is list of positional parms
# $# is number of parms (1 indicates one parm)
# $? is exit status of last pgm
# $- is current falgs
# $$ is process ID of the shell
# $! is process ID of most recent job created
# $0 name of shell
# $1...$n positional parms (e.g., with functions)
# $_ last arg to previous command
echo "Print args from a second shell:"
echo -n "  echo \$\$ \$# \$0...:  "
bash -c 'echo $$ $# $0 $1 $2' arg1 arg2 arg3
echo -n "  echo \$*:  "
bash -c 'echo $*' arg1 arg2 arg3

res=$?
echo "Result=$res"

