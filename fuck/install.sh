#!/bin/sh
echo "Compiling program"
cc -o fuck fuck.c
echo "Creating /usr/local/bin if necessary"
sudo mkdir -p /usr/local/bin
echo "Copying fuck to /usr/local/bin"
sudo cp fuck /usr/local/bin/fuck
echo "Done!"
