#!/usr/bin/env bash

set +xv
#Setejem la variable de la pagina del centre
pagina="https://agora.xtec.cat/ies-sabadell/"

#Utilitzant el bucle while:
while true; do
	#agafem com a resultat la part numerica d'aquest curl 200 o 404
	resultado=$(curl -sIL $pagina | grep '^HTTP' | tail -1 | awk  '{print $2}')
	#Si el resultat és 200 voldra dir que ha trobat la pagina
	if [[ "$resultado" == "200" ]]; then
  	   echo "Connexió establerta. Obrint el navegador..."
	#Per tant obrim firefox amb la url del centre
           firefox $url & 
           exit 0
	#En cas contrari (404) ens dona error
	elif [[ "$resultado" == "404" ]]; then
  	   echo "No hi ha connexió a Internet. Esperant 5 segons..."
	   sleep 5
	#En altre cas com som molt guays farem mostrar al usuari que som coneixedors d'altre 
	#tipus de resultat obtingut al curl
	else
  	    echo "No ho sé"
	fi
done
