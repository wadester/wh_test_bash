#!/bin/bash
# Module:   bash_math.sh
# Purpose:  sample math in Bash using multiple means
# Date:     10/23/2015
# Notes:
# 1) Ref:
#    http://faculty.salina.k-state.edu/tim/unix_sg/bash/math.html
echo "bash_math.sh:  basic bash math using multiple means"

echo "Basic integer math:"
A=1
B=2

echo "A=$A, B=$B"

# note the \$ in the comment to prevent expansion of the expr
echo "Add using Bash's double prens:  C=\$((A+B))"
C=$((A+B))
echo "C=A+B:  $C"

echo "Divide using Bash's double prens:  C=\$((A/B)) -- note INTEGER!"
C=$((A/B))
echo "C=A/B:  $C"

echo "Use declare to define variable as int"
n1=10/2
declare -i n2
n2=10/2
echo "n1=$n1 n2=$n2 [n1 not declared, n2 declared as int]"

echo "Use expr to evalute math, this is an external cmd used by older shells"
echo "- need spaces around the operator +"
x=`expr $A + 1`
echo "x=\`expr \$A + 1\` = $x"

echo "Use let to evaluate math, this is built-in with Bash"
echo "- can remove \$ before variable"
echo "- can't have spaces around the operator +"
let x=A+1
echo "let x=A+1= $x"

echo "Use bc, Python, or Perl for floating point"
echo "- variables must be strings"
pi=3.1415
pi2=`echo "$pi * 2" | bc`
echo "pi2=\`echo \"\$pi * 2\" | bc\`   pi=$pi  pi2=$pi2"

echo
echo "Math comparisons"
echo "- best to use (( and )), if not use test (old way)"
echo -n "if ((A < B)); then   result-> "
if ((A < B)); then
  echo "A < B"
else
  echo "B < A"
fi

echo "Old way using -lt, -gt, etc."
echo -n "if [ \$A -lt \$B ]; then  result-> "
if [ $A -lt $B ]; then
  echo "A < B"
else
  echo "B < A"
fi
