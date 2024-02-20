#!/bin/bash

#Posem les  variables per a la connexió SSH
remote_user="orejasm"
remote_host="192.168.0.1"
remote_file="/home/orejasm/prova1.txt"

#Aqui fem serfir el  HereDocs per a les comandes SSH
ssh_commands=$(cat <<EOF
#visulitzar un fitxer que ja esta a la maquina
cat $remote_file
#veure l'id de l'usuari de la maquina
id -u orejasm
#fer un ping en aquesta mateixa maquina per combrovar la connectivitat
ping -c 4 192.168.0.2
# Podem afegir més comandes si és necessari
EOF #Tanquem (End Of File)
)

# Executem les comandes SSH amb HereDoc
ssh "$remote_user@$remote_host" "$ssh_commands"
