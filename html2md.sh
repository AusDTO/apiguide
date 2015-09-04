#!/bin/bash

HTML_SRC="_build/html"
MD_SRC="_build/md"

# we need the HTML to have been build
if [ ! -d "$HTML_SRC" ]
then
    echo "ERROR: missing directory, %s" % $HTML_SRC
    exit 1
fi

# we need a target to build to
if [ ! -d "$MD_SRC" ]
then
    mkdir "$MD_SRC"
fi

oldpwd=`pwd`
cd $HTML_SRC
for file in `find . | grep "\.html$"`
do
    pandoc -f html -t markdown -o ../md/$file $file
done
