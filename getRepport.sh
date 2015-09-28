#!/bin/bash
# enable a new latex project with the $1 name

if [[ $# -ne 1 ]]; then
    echo "Usage : getRepport.sh [rapport_name]"
    exit
fi

name=$1
tex=".tex"

git clone git@bitbucket.org:Snipy/latexmodel_mse.git rapport
mv rapport/base_model.tex rapport/$name$tex
tmp="$$tmp$$"
cat rapport/Makefile | sed -e "s/MAIN\ =\ base_model.tex/MAIN\ =\ $name$tex/" > rapport/$tmp
mv rapport/$tmp rapport/Makefile
rm -rf rapport/.git
