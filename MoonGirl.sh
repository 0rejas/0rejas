#!/bin/bash

#Utilitzem un Trap que printa al fer CNTRL+C. No et treu del codi, et posa al menu.
trap 'connexio="True"; echo "Sortint del bucle. Sisplau seleccioneu una opció";' SIGINT
connexio='False'

#Variable de la IP buida.
IP=""

#Demanem una IP al usuari.
read -p "Quina IP analitzar?:" IP

#Funcio per fer la comprovació de connexió amb la Maquina remota (IP).
comprovar_conn () {
	#Bucle while per fer ping a la IP. Si no fa connexió no s'acaba mai.
	while  [ $connexio != 'True' ];
	do
		#Si fa ping, la variable 'connexio'='True' i sortim del bucle.
		if  ping -c 1 $IP
		then
			connexio='True'
		else
			echo "Error de connexió!"
		fi
	done
}

#Funció per generar la clau publica per a fer les connexions pertinents.
generar_clau () {
	#Generem la clau.
	echo "Generant clau publica..."
	if [ -f ~/.ssh/id_rsa ]; then
	    rm ~/.ssh/id_rsa
	    rm ~/.ssh/id_rsa.pub
	fi
	ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa &>/dev/null
	echo "Clau generada correctament"
	#Copiem la calu a la Maquina (IP).
	ssh-copy-id root@$IP &>/dev/null
}

#Funció main on es troben totes les opcions.
main () {
	#Bucle while, mentre 'sortir' no canviï, no s'acaba. Per sortir s'ha d'apretar el 7.
	while [[ $sortir != 'sortir' ]]
	do
		#Fem un if utilitzant la variable anterior 'connexio'.
		if [ connexio != 'False' ];
		then
			#Truquem la funcio 'menu'.
			menu

			#Preguntem a l'usuari que vol fer. 
			read -p "Que vols fer?:" option
			#Utilitzem un case per a presentar les opcions.
			case $option in

				#Obrim connexió ssh contra la mv. Utilitzant Here-docs veiem la informació de la CPU.
				'1')
					ssh root@$IP <<- 'EOF'
					echo -e "Informació de la CPU:\n"
					lscpu
					EOF
				;;

				#Obrim connexió ssh contra la mv. Utilitzant Here-docs veiem la informació dels discos.
                                '2')
					ssh root@$IP <<- 'EOF'
					echo -e "Informació dels discos:\n"
					lsblk
					EOF
                                ;;

				#Obrim connexió ssh contra la mv. Utilitzant Here-docs veiem la informació de PCI,USB i RAM.
                                '3')
                                       	ssh root@$IP <<- 'EOF'
					echo -e "Informació de PCI:\n"
					lspci
					echo -e "\n"
					echo -e "Informació de USB:\n"
					lsusb
					echo -e "\n"
					echo -e "Informació de RAM:\n"
					free
					EOF
                                ;;

				#Obrim connexió ssh contra la mv. Mostrem informació dels serveis.
				'4')
					ssh root@$IP "echo "Llistat dels Serveis:";systemctl list-unit-files --type service -all"
					#Utilitzem read per preguntanr si l'usuari vol guardar un resum dels serveis.
					read -p "Vols guardar un resum dels serveis?: [s\n] " serveis
					serveis="${serveis^^}"
					#Fem un if per guardar el resum al fitxer 'resum_serveis.txt'
					if [ $serveis == 'S' ]; then
						ssh root@$IP "systemctl list-units --type=service">resum_serveis.txt
						echo "El resum s'ha desat al arxiu 'resum_serveis.txt'"
					fi
				;;

				#Obrim connexió ssh contra la mv. Fem un update, Instal·lem nmap i analitzem els ports.
				'5')

					ssh root@$IP "echo "Carregant...";apt-get update &>/dev/null;apt-get install -y nmap &>/dev/null;echo "Informació dels ports:";nmap -u $IP;"

				;;

				#Obrim connexió ssh contra la mv. Utilitzant Here-docs reiniciem el sistema.
				#(A vegades donava com un error de que la maquina requeria d'un reboot, per això he fet aquesta opció.)
				#Si l'usuari intenta fer cap comprovació mentre la maquina esta fent el reboot donarà error, s'ha de fer c+ctrl.
				'6')

					ssh root@$IP <<- 'EOF'
					echo -e "Reiniciant el sistema...\n"
					echo "Espereu uns segons"
					reboot
					EOF

				;;

				#Opció per a cambiar la vriable sortir i sortir del bucle.
				'7')
					sortir="sortir"
					echo "Sortint..."
				;;

				*)
					echo  "Aquesta opció no existeix. Torna a provar."
				;;
			esac
			fi

	#Creem un arxiu HTML utilitzant la informació del fitxer creat anteriorment 'resum_serveis.txt'.
	#Variable per definir la data d'avui
	date=`date +%F`
	#Here-docs per crear i posar a dins de index.html
	cat <<- EOF > index.html
	<!DOCTYPE html>
	<html>
	<head>
		<title>Serveis de $IP</title>
	</head>
	<body>
		<h1>Informació dels serveis de $IP</h1>
		<h2>$date</h2>
		<h3>Orejas</h3>
	<pre>
	EOF
	cat resum_serveis.txt >> index.html 2>/dev/null
	echo '</pre>' >> index.html
	echo '</body>' >> index.html
	echo '</html>' >> index.html

	done
}

#Funció menu que mostra les opcions que l'usuari pot escollir
menu () {

	echo " __  __                  ___ _     _"
	echo "|  \/  |___  ___ _ _    / __(_)_ _| |"
	echo "| |\/| / _ \/ _ \ ' \  | (_ | | '_| |"
	echo "|_|  |_\___/\___/_||_|  \___|_|_| |_|"
	echo "________________________"
        echo "|1.CPU              (HW)|"
        echo "|2.Discos           (HW)|"
        echo "|3.PCI,USB,RAM      (HW)|"
        echo "|4.Serveis          (SW)|"
        echo "|5.Ports            (SW)|"
        echo "|6.Reiniciar sist.  (SW)|"
        echo "|7.Sortir               |"
        echo "------------------------"
}
sortir=''

#Les crides de les funcions
comprovar_conn
generar_clau
main
