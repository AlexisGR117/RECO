#!/bin/sh
menu=1
while [ $menu -lt 6 ] && [ $menu -gt 0 ]
do
	echo ""
	echo "Elija una opcion escribiendo su respectivo numero:"
	echo "1. Estadisticas para los protocolos TCP, UDP, ICMP e IP."
	echo "2. Informacion del controlador usado por la interfaz eth1."
	echo "3. Informacion de todas las interfaces de red activas e inactivas."
	echo "4. Tabla de enrutamiento en formato numerico."
	echo "5. Estadisticas de la interfaz eth1."
	echo "Para salir del menu de opciones cualquier otro numero."
	read menu
	echo ""
	case $menu in
		1)
			netstat -s | less
			;;
		2)
			ethtool -i eth1
			;;
		3)
			ifconfig -a
			;;
		4)
			route -n
			;;
		5)
			ethtool -S eth1 | less
			;;
	esac
done
		
