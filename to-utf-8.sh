#!/bin/sh
if [ $# -eq 0 ] ; then
	echo usage: to-utf-8.sh filename
	exit
fi

nkf --overwrite -w80 $1
