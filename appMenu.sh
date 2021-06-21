#!/bin/bash
echo 'Bienvenido a tools post_instalacion'
echo '-----------------------------------'



# se carga el primer menu general
menu=(`cat sources/menu.txt`)
n=${#menu[@]}

echo '*---------------------------------*'
echo '| Menu general post_instalacion   |'
echo '*---------------------------------*'
for ((i=0; i<n; i++))
do 
	echo $i")" ${menu[i]}
done
echo '*-------------------------------*'
echo '|      Inrgese opcion           |'
echo '*-------------------------------*'
# se carga el primer menu general

# leo opcion ingreada para saber a que subnenu ingresar
read opt
# leo opcion ingreada para saber a que subnenu ingresar

echo 'Elegite la opcion =>' ${menu[$opt]}
sleep 1
echo '----------- INGRESANDO -----------'
sleep 1

# limpio la pantalla para el segundo menu.
clear
# limpio la pantalla para el segundo menu.

# se carga el submenu segun opcion elegida anteriormente
submenu="${menu[$opt]}"
echo '*---------------------------------*'
echo '| Funciones disponibles           |'
echo '*---------------------------------*'
echo $submenu
echo '*-------------------------------*'
submenu=(`cat sources/submenu/${menu[$opt]}.conf`)
s=${#submenu[@]}
for ((i=0; i<s; i++))
do 
	echo $i")" ${submenu[i]}
done
echo '*-------------------------------*'
echo '|      Inrgese opcion           |'
echo '*-------------------------------*'
echo 'Puedes elegir mas de una ej: "0 1 3"'
# se carga el submenu segun opcion elegida anteriormente


# leo las opciones ingresadas y las guardo en un log tmp/
read opt1
echo $opt1 > tmp/opt1.log
# leo las opciones ingresadas y las guardo en un log tmp/



# guardo las variables ingresadas en un log para procesar la lista
getOpt=`sed 's/^\"//' tmp/opt1.log`
echo $getOpt > tmp/opt1.log
getOpt=`sed 's/\"$//' tmp/opt1.log`
echo $getOpt > tmp/opt1.log
getOpt=(`cat tmp/opt1.log`)
# guardo las variables ingresadas en un log para procesar la lista



# se cargan los scripts elegidos
listScript=(`cat tmp/opt1.log`)
n=${#listScript[@]}
for ((i=0;i<n;i++))
do
	script="${listScript[$i]}"
	source packages/"${menu[$opt]}"/"${submenu[$script]}".sh
done
echo ''
echo '*-------------------------------*'
echo 'Se cargo la funcion seleccionada'
for ((i=0;i<n;i++))
do
	script="${listScript[$i]}"
	echo "$script => " "packages/"${menu[$post]}"/"${submenu[$script]}".sh"
done
echo '*-------------------------------*'
# se cargan los scripts elegidos

echo ''
echo 'Desea continuar? yes / no'
read action
option="yes"
if [[ "$action" == "$option" ]]
then
echo '*-------------------------------*'
echo '========== Ejecutando ==========='
echo ''
for ((i=0;i<n;i++))
do
echo '*-------------------------------*'
	script="${listScript[$i]}"
	echo 'run => '${submenu[$script]}
	${submenu[$script]}
echo '*-------------------------------*'
	sleep 1
	echo ''
done
echo ''
echo '========== Ejecutando ==========='
else
	sleep 1
	echo 'Saliendo del programa'
	sleep 1

fi

