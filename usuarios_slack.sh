#!/bin/bash
case $1 in
	newgroup)
		groupadd -g $3 $2
	;;
	newuser)
		useradd $2 -g $3
		usermod -c $4 $2
		usermod -d $5 $2
		usermod -s /bin/$6 $2
		chmod $7$8$9 /usuarios/$2
	;;
	*)
		echo "Opcion no valida"
	;;
esac
