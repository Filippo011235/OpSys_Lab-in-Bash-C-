#!/bin/bash

DayNo=`date +%u`
#echo "${DayNo}"

#$ZDayNo = '7'

if [ "$DayNo" -ge "6" ]; then
    echo "Swieta, swieta!"
else
    echo "Zwykly dzien!"
fi

