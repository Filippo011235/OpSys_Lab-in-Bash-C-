#!/bin/bash
# $# ilosc arg $1, 2, 3...
# $@ lista arg
# asd.txt koko.txt qwerty.txt

for i in $@
do
    cat $i > ./PotokNazwany
    echo -------------------------------------
    cat $i
done
