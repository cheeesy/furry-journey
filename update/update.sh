#!/bin/bash

localCommit=""
newCommit=""

vimPath="$HOME/Repos/vim"

packagemanager="apt"

#boldText="\e[1m"
#redText="\e[31m"
#greenText="\e[32m"
#yellowText="\e[33m"
#blueText="\e[34m"
#purpleText="\e[35m"
# You can't actually use it as variables, so it's just there as a memory help.

if [ -f /tmp/updateScriptIsRunning ]; then
    echo -e "\e[1m\e[31mUpdate Script is already running!"
    exit
fi
touch /tmp/updateScriptIsRunning
echo -ne "\e[1m"
echo -e "\e[31m _   _           _       _       \n\e[38;5;202m| | | |_ __   __| | __ _| |_ ___ \n\e[33m| | | | '_ \\ / _\` |/ _\` | __/ _ \\ \n\e[32m| |_| | |_) | (_| | (_| | ||  __/\n\e[34m \\___/| .__/ \\__,_|\\__,_|\\__\\___|\n\e[35m~~~~~~|_|~~~~~~~~~~~~Eazy~Update~\n\e[0m" # Sorry for the crippled text, that's just the way bash wants it .

echo -e "\n\e[0m> \e[33mChecking for new vim updates...\e[0m"
cd $vimPath
localCommit=$(git rev-parse HEAD)
git pull
newCommit=$(git rev-parse HEAD)
if [ $localCommit = $newCommit ]; then
    echo -e "\e[0m>>\e[31m No new Vim version available! Skipping..."
else
    echo -e "\e[0m>>\e[32m New Vim version downloaded! Building...\e[0m"
    sleep 2
    make distclean
    ./configure
    make
    sudo make install
fi

if [ $packagemanager = "apt" ]; then
    echo -e "\e[0m> \e[33mChecking for apt updates\e[0m"
    sudo apt-get update
    sudo apt-get upgrade
elif [ $packagemanager = "pacman" ]; then
    echo -e "\e[0m> \e[33mChecking for pacman updates\e[0m"
    sudo pacman -Syu
fi

sudo youtube-dl -U

rm -f /tmp/updateScriptIsRunning
