#!/bin/bash
# Creates a new latex project with the $1 name

# Config
TEX='.tex'
PDF='.pdf'
REPOSITORY_URL='git@github.com:SnipyJulmy/hesso-latextemplate-lab.git'
REPORT_DIR='report'
MODEL_FILE='report'

# Parse arguments
if [[ $# -ne 1 ]]; then
    echo "Usage : getRepport.sh [report_name]"
    exit
fi
name=$1

# Get the latest code
git clone $REPOSITORY_URL $REPORT_DIR
mv $REPORT_DIR/$MODEL_FILE$TEX $REPORT_DIR/$name$TEX
tmp="$$tmp$$"

# Create Makefile with correct file names
cat $REPORT_DIR/Makefile | \
    sed -e "s/MAIN\ =\ $MODEL_FILE$TEX/MAIN\ =\ $name$TEX/" | \
    sed -e "s/FINAL\ =\ $MODEL_FILE$PDF/FINAL\ =\ $name$PDF/" \
    > $REPORT_DIR/$tmp

mv $REPORT_DIR/$tmp $REPORT_DIR/Makefile

# Add to gitignore
echo "$name$PDF" >> $REPORT_DIR/.gitignore

# Cleanup, remove git files and script
rm -rf $REPORT_DIR/.git
rm -rf $REPORT_DIR/getReport.sh

