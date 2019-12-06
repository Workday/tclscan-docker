#!/bin/bash
#set -x
for f in *.tcl; do
	echo $f
	cat $f | docker run --rm -i tclscan check -
done
