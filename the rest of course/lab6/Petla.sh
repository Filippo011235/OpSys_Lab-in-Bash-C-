#!bin/bash

trap 'a' 14 #SIGALRM #14
trap 'b' 15 #SIGTERM #15
trap 'c' 10 #SIGUSR1 #10
trap '' 12 #SIGUSR2 #12

a()
{
    echo Konieeecccc
    exit 1
}

b()
{
    echo Pauza i wracam
}

c()
{
    echo wstrzymuje na miliard petli

    for licznik in {1..200}
    do
	if [ $licznik -eq 199 ]
	then
	    echo uwaga, koncze
	    exit 1;
	fi
    done
}

clear
echo $$

i=0

while [ 1 ]
do
    i=1
    sleep 1
done
