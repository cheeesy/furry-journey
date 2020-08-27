#!/bin/bash

args=("$@")

bold=$(tput bold)
normal=$(tput sgr0)

while IFS=':k '  read -r key val _; do
case $key in
    MemTotal)
        mem_used=$((mem_used + val))
        mem_full=$val
    ;;
    
    Shmem)
        mem_used=$((mem_used + val))
    ;;
    
    MemFree|Buffers|Cached|SReclaimable)
        mem_used=$((mem_used - val))
    ;;
esac
done < /proc/meminfo

mem_used=$((mem_used / 1024))
mem_full=$((mem_full / 1024))
privip=$(hostname -I | awk '{print $1}')
kernelver=$(uname -r)
user=${USER:-$(id -un || printf %s "${HOME/*\/}")}
hostname=${HOSTNAME:-$(hostname)}
de=${XDG_CURRENT_DESKTOP}
cpuinfo=$(sed 11q /proc/cpuinfo | grep "model name" | cut -c 14-)
me='./'
me+=$(basename $0)
diskspace=$(df -h "${me}" | tail -n1 | awk '{print $2}')
diskspaceused=$(df -h "${me}" | tail -n1 | awk '{print $3}')
diskpart=$(df -h "${me}" | tail -n1 | awk '{print $6}')
diskfree=$(df -h "${me}" | tail -n1 | awk '{print $4}')
diskspace+='iB' # df -h prints out in powers of 1024, so add the iB for this.
diskspaceused+='iB'

alltehload=$(cat /proc/loadavg)

loadavg=$(echo ${alltehload} | awk '{print $1}') # Can't get it to work in for loop :(
loadavg+=', '
loadavg+=$(echo ${alltehload} | awk '{print $2}')
loadavg+=', '
loadavg+=$(echo ${alltehload} | awk '{print $3}')

distro=$(lsb_release -s -i)
distro+=' '
distro+=$(lsb_release -s -r)
distro+=' '
distro+=$(uname -p) # Shout out to bash for having a shitty string contatenation system.

tput bold
printf "┌"
for i in {0..36..1}
do
    printf "─"
done
printf " INFO "
for i in {0..37..1}
do
    printf "─"
done
printf "┐\n"
printf "│"
for i in {0..80..1}
do
    printf " "
done
printf "│\n"
tput sgr0
echo -ne "    Name:\t\t${hostname}\n"
echo -ne "    IP:\t\t\t${privip}\n"
echo -ne "    Distro:\t\t${distro}\n\n" # Printf refuses to print a string that contains whitespace
echo -ne "    CPU:\t\t${cpuinfo}\n"
echo -ne "    Memory:\t\t${mem_full}MiB\n" # /${mem_full}MiB\n"
echo -ne "    Disk:\t\t${diskspaceused}/${diskspace} (${diskpart})\n\n"
echo -ne "    Load:\t\t${loadavg}\n"
echo -ne "    Free Memory:\t$((mem_full - mem_used))\n"
echo -ne "    Free Disk:\t\t${diskfree}\n"

tput bold
printf "│"
for i in {0..81..1}
do
    printf " "
done
# printf "|"
echo -e "│"
printf "└"
for i in {0..37..1}
do
    printf "─"
done
printf " INFO "
for i in {0..37..1}
do
    printf "─"
done
printf "┘\n"
tput sgr0
