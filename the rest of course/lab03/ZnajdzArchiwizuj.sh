#!/bin/bash

# wywolanie:
# ... -n NAZWA -m CZAS -a ARCHIWUM

clear
ls -l

#getopt
set -- `getopt n:m:a: $*`  # : mowi, ze musi miec arg
if test $? != 0       # exit status of the last executed command
then
    echo 'Cos nie styklo'
    exit 2
fi
for i
do
    case "$i"
    in
	-n)
	    echo Flaga -n:
	    echo $2
	    NAZWA=$2;
	    shift; shift; ;;
	-m)
	    echo Flaga -m:
	    echo $2
	    CZAS=$2; shift; shift ;;
	-a)
	    echo Flaga -a:
	    echo $2
	    ARCHIWUM=$2; shift; shift ;;
	--)      # ... poniewaz zawsze na koncu jest
	    shift; break ;;
    esac
done

echo Argumety wywolania:
echo $NAZWA
echo $CZAS
echo $ARCHIWUM

#find and archive
echo Znalazlem takie pliki + takie pakuje:
find -name "*$NAZWA" -mtime -$CZAS -exec tar -czvf $ARCHIWUM.tar.gz {} +

# spr poprzez wejscie do "smietnika", wyswietl pliki i usun
tar -xzvf $ARCHIWUM.tar.gz -C ./smietnik
cd smietnik
echo zawartosc smietnika ktora zaraz usune
ls
yes | rm *$NAZWA
echo wracam do glownego i usuwam *.gz
cd ..
rm *.gz
ls -l

