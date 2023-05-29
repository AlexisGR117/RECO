#!/bin/bash
echo "Elija una opcion de ordenamiento escribiendo su respectivo numero:"
echo "1. Mas reciente"
echo "2. Mas antiguo"
echo "3. Tamano de mayor a menor"
echo "4. Tamano de menor a mayor"
echo "5. Tipo de archivo"
echo "6. Inicien con una cadena dada"
echo "7. Termine con una cadena dada"
echo "8. Contengan una cadena dada"
echo "Para salir del menu ingrese cualquier otro numero"
read menu
while [ 8 -ge $menu ] && [ $menu -ge 1 ] 
do
	if [ 5 -ge $menu ]
	then	
	case $menu in
		1)
			clear
			ls $1 -l -t -a | awk '{print $6"\t"$7"\t"$9}' |less
			ls $1 -l -t -a | awk '{print $6" "$7}' | sort | uniq -c
		;;
		2)
			clear
			ls $1 -l -t -r -a | awk '{print $6"\t"$7"\t"$9}' | less
			ls $1 -l -t -r -a | awk '{print $6"\t"$7}' | sort | uniq -c
		;;
		3)
			clear
			ls $1 -lh -S -a | awk '{print $5"\t"$9}' | less
			ls $1 -lh -S -a | awk '{print $5}' | sort | uniq -c
		;;
		4)
			clear
			ls $1 -lh -S -r -a | awk '{print $5"\t"$9}' | less
			ls $1 -lh -S -r -a | awk '{print $5}' | sort | uniq -c
		;;
		5)	
			clear
			ls $1 -l -X -a | awk '{print $9}' | less
		;;
	esac
	else
	echo "Ingrese la cadena"
	read cadena
	echo "Lista de archivos del directorio indicado junto con sus subdirectorios?"
	echo "1. Si"
	echo "2. No"
	read sub
	case $sub in
		1)
		case $menu in
			6)
				clear
				find -name "$cadena*" | less 
			;;
			7)
				clear
				find $1 -name "*$cadena" | less
			;;
			8)
				clear
				find $1 -name "*$cadena*" | less
			;;
		esac
		;;
		2)
		case $menu in
			6) 
				clear
				ls $1/$cadena* -a -d | less
			;;
			7)
				clear
				ls $1/*$cadena -a -d | less
			;;
			8)
				clear
				ls $1/*$cadena* -a -d | less
			;;
		esac
		;;
	esac
	fi
	echo "Elija una opcion de ordenamiento escribiendo su respectivo numero:"
	echo "1. Mas reciente"
	echo "2. Mas antiguo"
	echo "3. Tamano de mayor a menor"
	echo "4. Tamano de menor a mayor"
	echo "5. Tipo de archivo"
	echo "6. Inicie con una cadena dada"
	echo "7. Termine con una cadena dada"
	echo "8. Contenga una cadena dada"
	echo "Para salir del menu cualquier otro numero"
	read menu
done
			




























