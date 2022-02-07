#!/bin/bash
#set -x
duration=${1:-1.5}
delay=${2:-10}
typeset -i loops=$(echo "(60*60*$duration)/($delay*4)" | bc)
#echo "loops=$loops"; sleep 1
for ((i=0; i<loops; i++)); do
    clear
    echo -n "|";
    sleep $delay;
    clear;
    echo -n "/";
    sleep $delay;
    clear;
    echo -n "-";
    sleep $delay;
    clear;
    echo -n "\\";
    sleep $delay;
done
echo
