#!bin/bash
clear
cat ./$0

while [ 1 ]
do

    nice -n 19 echo napis jeden & nice -n 15 echo dwa & nice -n 1 echo 3 & nice -n 0 echo 4
    nice nice echo koniec napisow
    nice nice echo
    sleep 5
done
