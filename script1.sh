#!/bin/bash

while true; do
    # Mostrem un missatge a l'usuari
    echo "Benvingut a l'espiral d'emocions, alegries i èxits!"
    
    # Preguntem a l'usuari si vol continuar
    read -p "Estàs segur de continuar? (si/no): " resposta
    
    # Verifiquem la resposta de l'usuari
    case $resposta in
        [Ss]* )
            # Si la resposta és "si" o comença amb "s", obrim l'enllaç adjunt
	    # Si la resposta és "no" o comença amb "n", entrem a l'espiral d'emocions
            firefox https://youtu.be/jaLDoWqIq2M #Obrim l'enllaç del video
	    break  # Sortim del bucle
            ;;
        [Nn]* )
            #Espiral d'emocions, alegries i exits!!!!!
            ;;
    esac
done
