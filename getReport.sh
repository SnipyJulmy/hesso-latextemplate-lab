#!/bin/bash
# enable a new latex project with the $1 name

REPORT_DIR='report'

# Parse arguments
if [[ $# -ne 1 ]]; then
    echo "Usage : getRepport.sh [report_name]"
    exit
fi

name=$1
tex=".tex"

# Get the latest code
git clone git@bitbucket.org:Snipy/latexmodel_mse.git $REPORT_DIR
mv $REPORT_DIR/base_model.tex $REPORT_DIR/$name$tex
tmp="$$tmp$$"

# Create makefile with correct file name
cat $REPORT_DIR/Makefile | sed -e "s/MAIN\ =\ base_model.tex/MAIN\ =\ $name$tex/" > $REPORT_DIR/$tmp
mv $REPORT_DIR/$tmp $REPORT_DIR/Makefile

# Cleanup, remove git files and script
rm -rf $REPORT_DIR/.git
rm -rf $REPORT_DIR/getRepport.sh
