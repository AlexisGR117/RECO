#!/bin/sh
echo "Elija una opcion escribiendo su respectivo numero:"
echo "1. Ver los procesos que estan corriendo en el servidor"
echo "2. Buscar un proceso"
echo "3. Matar un proceso en ejecución"
echo "4. Salir del menu de opciones"
read menu
while [ $menu -ne 4 ]
do
	case $menu in
		1)
		ps aux | awk '{printf "%-25s%5s%5s%5s\n", $11, $2, $4, $3}' | less
		;;
		2)
		echo "Ingrese el nombre del proceso que quiere buscar"
		read proceso
		ps aux | grep $proceso 
		;;
		3)
		echo "Ingrese el PID del proceso que quiere matar"
		read PID
		kill $PID
		;;
	esac	
	echo "Elija una opcion escribiendo su respectivo numero:"
	echo "1. Ver los procesos que estan corriendo en el servidor"
	echo "2. Buscar un proceso"
	echo "3. Matar un proceso en ejecución"
	echo "4. Salir del menu de opciones"
	read menu
done
