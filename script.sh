#!/bin/bash

if [ "$1" == "" ]
then
 echo Digite o subnet mask, os três grupos de números de um IP, como por exemplo 192.168.1
else
 rm -f ips.txt
 X=0
 for i in {65..75}
 do
   IP=`ping -c1 $1.$i | grep "64 bytes" | cut -d " " -f4 | cut -c 1-12`
   if [ -z "$IP" ]
   then
    ((X=X+1))
   else
    HOST=`host $IP | cut -d " " -f5`
    echo IP:$IP  "       "    NOME DO DISPOSITIVO:$HOST | tee -a ips.txt

   fi
done
echo "            "
echo Nº DE IPS LIVRES: $X
fi
