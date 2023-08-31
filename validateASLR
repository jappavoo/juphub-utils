#!/bin/bash

count=$(for ((i=0;i<100; i++)); do gdb -ex starti -ex quit -q --batch /usr/bin/date 2>/dev/null | grep ld; done | tee out | uniq | wc -l)

if [[ $count == 1 ]]; then
   echo "OK:  Looks good"
   exit 0
else
   echo "ERROR: Failed to start a binary with a constant instruction addres: $count"
   exit -1
fi