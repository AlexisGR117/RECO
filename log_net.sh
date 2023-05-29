#!/bin/sh
clear
echo "Elija una opcion escribiendo su respectivo numero:"
echo "1. Mostrar las primer y ultimas n lineas de 3 archivos log"
echo "2. Mostrar las lineas de 1 que contengan una palabra en particular"
read menu
case $menu in
	1)
		head -n$1 /var/log/maillog > log.txt
	       	tail -n$1 /var/log/maillog >> log.txt
	        head -n$1 /var/log/secure >> log.txt
	       	tail -n$1 /var/log/secure >> log.txt
		head -n$1 /var/log/messages >> log.txt 
		tail -n$1 /var/log/messages >> log.txt 
		cat /aplicaciones/log.txt | less
	;;
	2)
		head -n$1 /var/log/maillog > log.txt
	        tail -n$1 /var/log/maillog >> log.txt
	        head -n$1 /var/log/secure >> log.txt
	        tail -n$1 /var/log/secure >> log.txt
	        head -n$1 /var/log/messages >> log.txt
	        tail -n$1 /var/log/messages >> log.txt
		cat /aplicaciones/log.txt | grep $2 --color
	;;
esac
