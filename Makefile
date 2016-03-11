#!/usr/bin/make
# Module:   Makefile
# Purpose:  make file for Bash test, mainly cleanup
# Author:   Wade Hampton
# Date:     10/23/2015
#
all::
	$(MAKE) README

README::
	asciidoc -o README.html README.md

clean::
	./cleanup.sh

cleanup::
	./cleanup.sh

