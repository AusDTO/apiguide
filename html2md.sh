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
    fnohtml=`echo $file | rev | cut -d"." -f2 | rev | sed -e 's|^/||'`
    mdname="../md/${fnohtml}.md"
    # this next bit will have a bug if nesting is more than one dir deep
    dirname=`echo $fnohmtl | rev | cut -d"/" -f2`
    if [ ! "$dirname" == "" ]
    then
	if [ ! -d $dirname ]
	then
	    mkdir $dirname
	fi
    fi
    # convert to markdown
    pandoc -f html -t markdown -o $mdname $file
    # find where the header ends and footer starts
    seg_from=`grep -n '\* \* \* \* \*' $mdname | head -1 | cut -d":" -f1`
    seg_to=`grep -n '\* \* \* \* \*' $mdname | tail -1 | cut -d":" -f1`
    # chomp the unwanted bits
    cat $mdname | head -$(($seg_to - 1)) | tail -$(($seg_to - $seg_from -2)) > $mdname.tmp
    mv $mdname.tmp $mdname
done
cd $oldpwd

# remove pages we don't want in the markdown site
rm $MD_SRC/index.md
rm $MD_SRC/copyright.md
rm $MD_SRC/http-routingtable.md
rm $MD_SRC/preface.md
rm $MD_SRC/search.md
rm $MD_SRC/genindex.md
