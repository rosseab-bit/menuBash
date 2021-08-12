#/bin/bash
# Cargar los modulos de los menues.
echo "ACTUALIZANDO MODULOS"
echo "*------------------*"
mkdir tmp
for dir in $(cat sources/menu.txt)
do
	if [[ -d "packages/$dir" ]]
	then
		echo "packages/$dir ===> ok"
		cp templates/infoTool.sh packages/"$dir"
	else
		echo "packages/$dir ===> created"
		mkdir packages/"$dir"
		cp templates/infoTool.sh packages/"$dir"
		> sources/submenu/"$dir".conf
	fi
done

for i in $(cat sources/menu.txt)
do 
	echo $i".conf"
	pwd
	cd packages/"$i"
	scripts=`ls -l *.sh | awk '{print $9}'`
	cd ../../
	echo $scripts > tmp/"$i".log
# cargo las funciones a los submenues.
	# vacio funciones viejas
	> sources/submenu/"$i".conf
	for sm in $(cat tmp/$i.log)
	do

		echo ${sm/.sh/} >> sources/submenu/"$i".conf
done	
done



