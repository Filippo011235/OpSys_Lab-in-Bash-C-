#!/bin/bash
# ARGUMENTY:
# 1 nazwa pliku
# 2 n. katalogu
# 3 nowa nazwa pliku 1.
# 4 prawa dostpu oktagonalnie lub alfanumerycznie 
# u=rwx,g=rx,o=r / 754
# 5 n. linku


echo Uruchomiono pllik $0 z $# argumentami

# TWORZENIE PLIKU, KATALOGU
echo "Czy stworzyc plik z nazwa $1? t/n"
read tn
if [ "$tn" = [Tt] ] ; then
    echo "Tworze $1"
    touch $1
else
    echo "NIE tworze pliku"
fi
#### wyswietla to "fi"

echo "Czy stworzyc katalog z nazwa $2? t/n"
read tn
if [ "$tn" = "t" ]
then
    echo "Tworz $2"
    mkdir $2
else
    echo "NIE tworze katalogu"
fi

echo "Dowod zmian:"
ls

# ZMIANA NAZWY
touch do_zmiany
echo "Zmienic nazwe pliku do_zmiany na $3? t/n"
read tn
if [ "$tn" = "t" ]
then
    mv do_zmiany $3
    echo "Dowod: "
    ls
else
    echo "zostawiam nazwe"
fi


### a co jak zmienimy nazwe? link + prawa + kasowanie
# ZMIANA UPRAWNIEN
echo "Zmieniac uprawnienia podanego pliku na $4? (t/n)"
read tn
if [ "$tn" = "t" ] ; then
    echo "Jaki plik?"
    read wybrany_plik
    echo "Zmieniam $wybrany_plik na $4"
    chmod $4 $wybrany_plik
    echo "Dowod:"
    ls -l
else
    echo "Zostawiam uprawnienia"
fi

#[[ "$var" == [Tt] ]] && echo "Zmieniam prawa" || echo "Zostawiam"

# LINKOWANIE
echo "Zrobic link twardy pomiedzy $1 a $5? (t/n)"
read tn
if [ "$tn" = "t" ] ; then
    echo "Jaki plik?"
    read wybrany_plik
    echo "Tworze link $wybrany_plik z $5, defacto to jest skrot"
    ln $wybrany_plik $5
    echo 'Dowod:'
    ls -l
else
    echo "Nie potrzeba takich rzeczy..."
fi

# KASOWANIE
echo 'czy usunac wszystko? (t/n) :('
read tn
if [ "$tn" = "t" ] ; then
    echo "USUWAM!"
    rm -v !("lab1.sh")
    echo "Dowod:"
    ls
else
    echo "Zostawiam"
fi

#[ "$var" = [Tt] ] && echo "USUWAM!" && rm $1 $5 && rmdir $2 || echo "Zostawiam"



: '
[[ "$var" == [Yy] ]] && echo "YES" || echo "NO"

if  [ "$var" = "Y" ] || [ "$var" = "y" ]
then
    echo "YES"
else
    echo "NO"
fi
'
