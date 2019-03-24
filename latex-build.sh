#!/bin/bash

make clean
make html
make latex
TEXFILE=_build/latex/coreutils.tex
#sed -i -e 's/commandchars/frame=single,commandchars/' $TEXFILE

cd _build/latex/
platex coreutils.tex && platex coreutils.tex && dvipdfmx -p b5 -r 600 -v -V 5 -o index-b5.pdf coreutils.dvi
