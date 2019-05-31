#!/bin/bash


while read adres; do
    echo "wysylam do $adres"
    (cat tresc.txt; uuencode op1.pdf op1.pdf; uuencode op2.pdf op2.pdf; uuencode op3.pdf op3.pdf) | mailx -s "Niezwykla oferta" $adres
done < ./adresy.txt






# POZOSTALE FORMULY
#(cat tresc.txt;uuencode op1.pdf op1.pdf) | mailx -s "Taki mail 2" latarka99@gmail.com 235130@student.pwr.edu.pl
#(cat tresc.txt;uuencode op*.pdf op*.pdf) | mailx -s "Gwiazdy" latarka99@gmail.com 235130@student.pwr.edu.pl

# z neta
#( cat tresc.txt; uuencode op1.pdf ) | mail -s "Z neta XD" latarka99@gmail.com 235130@student.pwr.edu.pl
# echo "Start of Body" && uuencode log.cfg readme.txt | mail -s "subject" "a@b.c"

#uuencode op1.pdf | mail -s "Z neta XD" latarka99@gmail.com 235130@student.pwr.edu.pl < tresc.txt

#(echo ""Some text""; uuencode op1.pdf op1.pdf) | mailx -s ""The subject goes here"" latarka99@gmail.com 235130@student.pwr.edu.pl
#uuencode op2.pdf op2.pdf | mailx -s "Attat" "latarka99@gmail.com" "235130@student.pwr.edu.pl"
#alpine < tresc.txt -attach op1.pdf -I '^X,Y' latarka99@gmail.com 235130@student.pwr.edu.pl
#alpine < tresc.txt -attach op2.pdf latarka99@gmail.com 235130@student.pwr.edu.pl | echo '^X' && echo 'Y'
#alpine < tresc.txt -attach op3.pdf latarka99@gmail.com 
#alpine < tresc.txt -attach op2.pdf -I '^X',Y latarka99@gmail.com 235130@student.pwr.edu.pl
#alpine -I ?,'^F','^F','^F'
#uuencode op1.pdf | mailx -s "Okna uunencode" latarka99@gmail.com 235130@student.pwr.edu.pl < tresc.txt
#uuencode -m op1.pdf | mailx -s 'Temat -m' latarka99@gmail.com < tresc.txt

