#!/bin/bash

#Trap que printa a l'hora de fer CNTRL+C. No et treu del codi.
trap 'connexio="True"; echo "Sortint del bucle...";' SIGINT
connexio='False'

#Per executar el codi, he utilitzat una IP 192.168.1.10/24.
IP=192.168.0.1

#Per analitzar una IP en concret, cal descomentar la següent linia.
#read -p "Quina IP analitzar?:" $IP

#bucle que fins que no aconsegueixi fer ping a 192.168.1.10, no acaba.
comprovar_conn () {
	while  [ $connexio != 'True' ];
	do
	#si podem fer ping, la variable 'connexio' passa a ser 'True' i surt del bucle.
		if  ping -c 1 $IP
		then
			connexio='True'
		else
			echo "Error de connexió!"
		fi
	done
}

generar_clau () {
	echo "Generant clau publica..."
	if [ -f ~/.ssh/id_rsa ]; then
	    rm ~/.ssh/id_rsa
	    rm ~/.ssh/id_rsa.pub
	fi
	ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa &>/dev/null
	echo "Clau generada correctament"
	ssh-copy-id root@$IP &>/dev/null
}

#bucle que mentre la variable 'sortir' no canvi, no acaba. per fer-ho l'usuari haura de premer el 4.
main () {
	while [[ $sortir != 'sortir' ]]
	do

		if [ connexio != 'False' ];
		then
			menu
			#input preguntant a l'usuari quina opció vol executar. En cas de premer una opció fora del rang
			#se li torna a demanar l'input. 
			read -p "Que vols analitzar?:" option
			case $option in
				#obrim connexió ssh contra la mv. Posteriorment mostrem informació del hardware.
				'1')
					ssh root@$IP <<- EOF
					echo "Informació de la CPU:"
					lscpu
					EOF
				;;

                                '2')
                                        ssh root@$IP "lscpu;lspci;lsblk;lsusb;"
                                        ssh root@$IP <<- EOF
                                        lshw -short
                                        free
                                        EOF
                                ;;

                                '3')
                                        ssh root@$IP "lscpu;lspci;lsblk;lsusb;"
                                        ssh root@$IP <<- EOF
                                        lshw -short
                                        free
                                        EOF
                                ;;

				#obrim connexió ssh contra la mv. Posteriorment mostrem informació dels serveis.
				'4')
					ssh root@$IP "systemctl list-unit-files --type service -all"
				#input preguntant si l'usuari desitja guardar un resum de lo mostrat.
					read -p "Desitjas guardar un resum dels serveis?: [s\n] " service
					service="${service^^}"
					if [ $service == 'S' ]; then
						ssh root@192.168.0.1 "systemctl list-units --type=service">status_services.txt
						echo "Resum desat a 'status_services.txt'"
					fi
				;;

				#obrim connexió ssh contra la mv i fem instal·lació nmap. Posteriorment analitzem ports.
				'5')
					ssh root@$IP "apt-get update;apt-get install -y nmap;nmap -u $IP;"
				;;

				'6')
					sortir="sortir"
				;;
				*)
					echo  "Torna a escollir. Aquest cop si potser, que sigui una opció de les que t'he mencionat."
				;;
			esac
		fi
	#creem un html amb la informació rebuda a 'status_services.txt'.
	date=`date +%F`
	cat <<- EOF > index.html
	<!DOCTYPE html>
	<html>
	<head>
		<title>Info dels serveis de $IP</title>
	</head>
	<body>
		<h1>Info dels serveis de $IP</h1>
		<h2>$date</h2>
	<pre>
	EOF
	cat status_services.txt >> index.html
	echo '</pre>' >> index.html
	echo '</body>' >> index.html
	echo '</html>' >> index.html

	done
}

#funció del menu que posteriorment cridarem
menu () {
	echo "------------"
        echo "|1.CPU      (HW)|"
        echo "|2.Discos   (HW)|"
        echo "|3.HardWare (HW)|"
        echo "|4.Serveis  (SW)|"
        echo "|5.Ports    (SW)|"
        echo "|6.Sortir       |"
        echo "------------"
}
sortir=''

comprovar_conn
generar_clau
main
					#ssh root@$IP "lscpu;lspci;lsblk;lsusb;"
					#lshw -short
					#free
