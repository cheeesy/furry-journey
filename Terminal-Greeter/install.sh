#!/usr/bin/env bash

echo "*Terminal-Greeter Installer*"

echo "> Checking for requirements"
if ! [ -x "$(command -v lolcat)" ]; then
    echo "Error: lolcat is not installed." >&2
    exit 1
fi

echo "> Installing Terminal-Greeter"
cp .greeter ~/.greeter
cp .gnu ~/.gnu

echo ">> Backing up .bashrc"
cp ~/.bashrc ~/.backup.bashrc

echo ">> Configuring .bashrc"
echo "if [ -f ~/.greeter ]; then" >> ~/.bashrc
echo "    . ~/.greeter" >> ~/.bashrc
echo "fi" >> ~/.bashrc

echo "*Done!*"
