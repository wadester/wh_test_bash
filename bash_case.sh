#!/bin/bash
# Module:   bash_case.sh
# Purpose:  case statements
# Date:     N/A
# Notes:
# 1)  http://www.tldp.org/LDP/abs/html/abs-guide.html
#

echo "bash_case.sh:  BASH case statements"

echo "Simple test of case with a list"
for x in a A 1 2 '.' asdf Asdf ASDF
do
  echo "Item=$x"
  case "$x" in
    [[:lower:]]   ) echo "Lowercase letter";;
    [[:upper:]]   ) echo "Uppercase letter";;
    [0-9]         ) echo "Digit";;
    *             ) echo "Punctuation, whitespace, or other";;
  esac      #  Allows ranges of characters in [square brackets],

done

echo "Use of select to choose items"
echo "Pick your favorite architecture:"
select arch in "i386" "i686" "x86_64" "mips" "arm" "atmega"
do
  echo
  echo "Arch is $arch"
  break
done

echo "One line list of scripts:"
scripts=`ls -1 *.sh`
ii=0; for a_script in $scripts ; do echo "script[$ii]=$a_script"; ((ii++)); done