#!/bin/bash
# Module:   bash_args.sh
# Purpose:  arg processing
# Date:     10/28/2015
# Notes:
# 1) https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
#

echo "bash_args.sh:  Bash args and special chars"

echo "Pass some args on the command line, they will be echoed here:"

echo "Script name is \$0:  $0"

echo "Using a BASH array assigned via (\"\$@\"): "
args=("$@")
echo "Count of args=$#"
echo "First arg=${args[0]}"

i=0
for x in "${args[@]}"; do
    echo "ARG[$i] = $x"
done
bash -c 'echo $$ $# $0 $1 $2' arg1 arg2 arg3

echo "Using the index to args:"
i=0
while ((i < $#)); do
    echo "ARG[$i] = $1"
    shift 1
done

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

