#!/usr/bin/env bash

clear
gcc -lrt -Wall PamiecWspolna.c
#read -n 1 znak
read znak
if [ "$znak" = "t" ]; then
    clear
    ./a.out
fi
    
       
