#!/bin/bash
title="Pelican Script"
version=1.0

pelipath="/home/user/pelican" # The path your pelican instance is stored in
pelitheme="simple" # The theme pelican will be using. This will override THEME in pelicanconf.py
nopathfix=false
# A Pathfix is necessary if you plan on putting the output of Pelican on somewhere other than the root directory of the web server.

hello() {
    echo -e "\n\e[1m\e[34m$title Version $version\e[0m"
}

makecontent() {
    echo -e "\e[31m> Generating content\e[0m"
    if [ $(pwd) != $pelipath ]; then
	echo -e "\e[31m>> Oops! I was not in the pelican directory!\e[0m"
	cd $pelipath # Make sure we're in the right directory!
    fi
    
    pelican # Generate the content
    echo -e "\e[31m> Content generation done!"
}

fixpaths() { # Pelican likes to make CSS links to the root, while I don't want it in my server
    echo -e "\e[38;5;202m>> Fixing links in every html file, level one."
    sed -i 's;"/;"./;g' $pelipath/output/*.html # Fix CSS link paths in every html file, level one.
    echo ">> Fixing links in every html file, level two."
    echo -e "\e[33m>>> author/"
    sed -i 's;"/;"../;g' $pelipath/output/author/*.html
    echo ">>> category/"
    sed -i 's;"/;"../;g' $pelipath/output/category/*.html
    echo ">>> tag/"
    sed -i 's;"/;"../;g' $pelipath/output/tag/*.html
}

hello
makecontent
echo -n "> Is a Pathfix necessary?"
sleep 1 # Makes it look like it's actually working LOL
if [ ! $nopathfix == true ]; then
    echo -e " Yes.\n> Fixing paths..."
    fixpaths
else
    echo -e " No.\n> Skipping Pathfix..."
fi


