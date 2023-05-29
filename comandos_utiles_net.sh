#!/bin/sh
menu=1
while [ $menu -lt 6 ] && [ $menu -gt 0 ]
do
	echo ""
	echo "Elija una opcion escribiendo su respectivo numero:"
	echo "1. Estadisticas para los protocolos TCP, UDP, ICMP e IP."
	echo "2. Ver el trafico de la red por dias."
	echo "3. Informacion de todas las interfaces de red activas e inactivas."
	echo "4. Tabla de enrutamiento en formato numerico."
	echo "5. Mostrar el ancho de banda en tiempo real."
	echo "Para salir del menu de opciones cualquier otro numero."
	read menu
	echo ""
	case $menu in
		1)
			netstat -s | less
			;;
		2)
			vnstat -d
			;;
		3)
			ifconfig -a
			;;
		4)
			route -n show -inet
			;;
		5)
			vnstat -l -i wm0
			;;
	esac
done
		
