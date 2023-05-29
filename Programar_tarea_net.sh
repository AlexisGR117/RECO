#!/bin/sh
p=$2
minutos="*"
dias="*"
horas="*"
v=1
if echo "$p" | grep -Eq 'm$' ; then
	let m=$(echo "$p" | sed 's/m$//')
	if [ $m -gt 0 ]; then
		h=$((m/60))
		if [ $h -gt 0 ]; then
			p="$h""h"
			m=$((m-h*60))
		fi
		minutos="*/$m"
	else
		echo "El valor de los minutos debe ser mayor a 0"
	fi
fi
if echo "$p" | grep -Eq 'h$' ; then
	let h=$(echo "$p" | sed 's/h$//')
	if [ $h -gt 0 ]; then
		d=$((h/60))
		if [ $d -gt 0 ]; then
			p="$d""d"
			h=$((h-d*60))
		fi
		horas="*/$h"
	else
		echo "El valor de las horas debe ser mayor a 0"
	fi
fi
if echo "$p" | grep -Eq 'd$' ; then
	let d=$(echo "$p" | sed 's/d$//')
	if [ $d -gt 31 ] || [ $d -lt 0 ]; then
		echo "El valor de las horas debe ser mayor a 0"
	else
		dias="*/$d"
	fi
fi
if [ $v -eq 1 ]; then
	(crontab -l ; echo "$minutos $horas $dias * * /aplicaciones/$1.sh") | crontab -
fi
