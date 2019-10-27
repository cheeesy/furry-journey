#!/usr/bin/env bash

echo "*Installing Terminal-Greeter*"

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
