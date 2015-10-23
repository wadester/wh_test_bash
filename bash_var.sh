#!/bin/bash
# Module:   bash_var.sh
# Purpose:  variable empty/set tests
# Date:     10/23/2015
# Notes:
# 1) See:
#    http://stackoverflow.com/questions/228544/how-to-tell-if-a-string-is-not-defined-in-a-bash-shell-script  
#

echo "bash_var.sh - variable status checks"
echo "Unsetting variable var:"
unset var
[ -n "$var" ] && echo "var is set and not empty"
[ -z "$var" ] && echo "var is unset or empty"
[ "${var+x}" = "x" ] && echo "var is set, may be empty"
[ -n "${var+x}" ] && echo "var is set, may be empty"
[ -z "${var+x}" ] && echo "var is unset"
[ -z "${var-x}" ] && echo "var is set and empty"

echo "Setting var to null via var="
var=
[ -n "$var" ] && echo "var is set and not empty"
[ -z "$var" ] && echo "var is unset or empty"
[ "${var+x}" = "x" ] && echo "var is set, may be empty"
[ -n "${var+x}" ] && echo "var is set, may be empty"
[ -z "${var+x}" ] && echo "var is unset"
[ -z "${var-x}" ] && echo "var is set and empty"


echo "Defining var=42"
var=42
[ -n "$var" ] && echo "var is set and not empty"
[ -z "$var" ] && echo "var is unset or empty"
[ "${var+x}" = "x" ] && echo "var is set, may be empty"
[ -n "${var+x}" ] && echo "var is set, may be empty"
[ -z "${var+x}" ] && echo "var is unset"
[ -z "${var-x}" ] && echo "var is set and empty"

