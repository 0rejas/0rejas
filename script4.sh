#!/bin/bash

# Funció per comprovar l'estat d'un servidor (ping)
comprova_estat() {
    ip=$1
    local resultat

    # Aquí podriem afegir altres comprovacions com fer un ssh o lagu així del rollo saps
    ping -c 1 $ip > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        resultat="OK"
    else
        resultat="FAILED"
    fi

    echo "Servidor $ip: $resultat"
}

# Aquesta és la funció principal
main() {
    # Verifiqum si el fitxer ips.txt existeix
    if [ ! -f ips.txt ]; then
        echo "Error: No es troba el fitxer ips.txt"
        exit 1
    fi

    # Aquest serà el fitxer on es guardarem els resultats obtinguts pels pings
    resultat_fitxer="resultats.txt"

    # Esborrem el fitxer de resultats en cas de que ja existeixi
    [ -f $resultat_fitxer ] && rm $resultat_fitxer

    # Realitzaem bucle while per llegir cada IP del nostre fitxer ips.txt
    while read -r ip || [[ -n "$ip" ]]; do
	#Truquem a la funció que s'encarrega de fer les comprovacions (pings)
        comprova_estat "$ip" >> $resultat_fitxer
    done < "ips.txt"

    echo "Comprovació completada. Resultats guardats a $resultat_fitxer"
}

# Executem la funció principal main
main
