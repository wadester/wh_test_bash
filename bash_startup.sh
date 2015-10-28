#!/bin/bash
# Module:   bash_startup.sh
# Purpose:  startup and interactive tests, misc
# Date:     10/28/2015
# Notes:
# 1) https://www.gnu.org/software/bash/manual/bash.html#Bash-Startup-Files
#

echo "bash_startup.sh:  startup and interactive tests"

echo "Typically reads /etc/profile, can stop by --noprofile"
echo "  - then it trys ~/.bash_profile, ~/.bash_login, and ~/.profile"
echo "Typically read ~/.bashrc, can stop by using --norc"
echo "Can specify a different RC file with  --rcfile file "

echo "Interactive test (should be NOT interactive as it is a script)"
case "$-" in
     *i*)	echo This shell is interactive ;;
     *)	echo This shell is not interactive ;;
esac
