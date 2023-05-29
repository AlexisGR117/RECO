#!/bin/sh
echo "Elija una opcion de busqueda escribiendo su respectivo numero:"
echo "1. Buscar archivo dada la ruta y el nombre o parte de este"
echo "2. Buscar palabra o parte de esta en un archivo dado"
echo "3. Buscar palabra o parte de esta en un archivo dado el nombre o parte de este"
echo "4. Contar la cantidad de lineas de un archivo"
echo "5. Contar la cantidad de veces que se repite una palabra en el mismo archivo"
echo "Para salir del menu ingrese cualquier otro numero"
read menu
case $menu in
	1)
		find $1 -name "*$2*" 
		echo "Cantidad de veces que se encontro el archivo:"
		find $1 -name "*$2*" | wc -l
	;;
	2)
		grep $2 $1 -n --color
		echo "Cantidad de veces que se repitio la palabra:"
		grep $2 $1 -o | wc -l
	;;
	3)
		grep $3 $1/*$2* -n --color 
		echo "Cantidad de veces que se repitio la palabra:"
		grep $3 $1/*$2* -o | wc -l
	;;
	4)
		echo "Cantidad de lineas en el archivo dado:"
		wc -l $1
	;;
	5)
		echo "Cantidad de veces que se repite la palabra dada en el archivo"
		grep $2 $1 -o | wc -l
	;;
esac
