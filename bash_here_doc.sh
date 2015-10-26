#!/bin/bash
# Module:   bash_here_doc.sh
# Purpose:  Examples of Bash Here Documents
# Date:     10/25/2015
# Notes:
# 1) These are some simple examples of heredoc and other features
#
echo "bash_here_doc.sh:  example of Bash Here Docs"

OF="bash_here_doc.tmp"
A="Define A to be 1"
B="B is 2"
echo "Most common is output to a file using cat with assignments"
echo "  A=\"$A\" and B=\"$B\""

# simple here doc from the command to the the EOF
cat >${OF}  <<EOF
This is a common use of Bash Here Docs where the doc
  is written in multiple lines and there are shell variable
expansions in the file \t \n \r like this:
$A
and
$B

Typically use EOF and end with "EOF" on a line by itself.
EOF

echo
echo "Output via a simple loop to iterate over all lines in a file"
ii=1
while read aline; do
    # simple echo for output
    #echo $aline

    # or use printf, note quotes around aline to make a clean string
    printf "%03d %s\n" $ii "$aline"
    ((ii++))
done <${OF}  # input is the file name as defined above

echo
echo "Output via while loop w/ some options"
echo "  - use -r on read to prevent backslash interperation"
echo "  - set IFS so we preserve indentation"
ii=1
while IFS= read -r aline; do
    printf "%03d %s\n" $ii "$aline"
    ((ii++))
done <${OF}  # input is the file name as defined above


echo
echo "Output via reading from a variable that consumed the file"
echo "  - useful for reading single words from a file"
echo "  - not useful for our example as we have whitespace"
flines=`cat ${OF}`
ii=1
for aline in $flines; do
    printf "%03d %s\n" $ii "$aline"
    ((ii++))
done 
