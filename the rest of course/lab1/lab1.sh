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
if [ "$tn" = "t" ] ; then
    echo "Tworze $1"
    touch $1
else
    echo "NIE tworze pliku"
fi

echo ""
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
# ... plus touch do nastepnego punktu
touch do_zmiany
ls

# ZMIANA NAZWY
echo ""
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

# ZMIANA UPRAWNIEN
echo ""
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
echo ""
echo "Zrobic link twardy pomiedzy jakims plikiem a $5? (t/n)"
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
echo ""
echo 'czy usunac wszystko? (t/n) :('
read tn
if [ "$tn" = "t" ] ; then
    echo "USUWAM!"
    # This option allows for more advanced pattern matching
    #shopt -s extglob
    #  syntax error at line 90: `(' unexpected
    #rm -- !('lab1.sh') 
    find . ! -name 'lab1.sh' -type f -exec rm -f {} +
    rm -rf $2
    echo "Dowod:"
    ls
else
    echo "Zostawiam"
fi

#[ "$var" = [Tt] ] && echo "USUWAM!" && rm $1 $5 && rmdir $2 || echo "Zostawiam"



: '
[[ "$var" == [Yy] ]] && echo "YES" || echo "NO"
'
