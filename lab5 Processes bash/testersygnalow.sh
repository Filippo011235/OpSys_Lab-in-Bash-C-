#!bin/bash
clear

: '
trap lastwish 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

lastwish(){
    echo
    echo "zlapalem cos!"
    echo
}
'

### main

echo $$   # display pid

while [ 1 ]
do
    echo `date +"%T"`
    sleep 1
done

# kill -L -> daje nazwy i kody syg.
