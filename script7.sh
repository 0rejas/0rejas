#!/bin/bash

while true; do
    # Mostrem les opcions al jugador
    echo "Joc de Pedra, Paper o Tisores"
    echo "1. Pedra"
    echo "2. Paper"
    echo "3. Tisores"
    echo "4. Sortir"

    # Llegim la opció de l'usuari
    read -p "Escull una opció (1-4): " opcio

    case $opcio in
        1)
            jugador="Pedra"
            ;;
        2)
            jugador="Paper"
            ;;
        3)
            jugador="Tisores"
            ;;
        4)
            echo "Adeu!"
            exit 0
            ;;
        *)
            echo "Opció no vàlida. Torna a intentar."
            continue
            ;;
    esac

    # Generem la opció de la màquina (aleatòriament)
    maquina=$(( (RANDOM % 3) + 1 ))

    case $maquina in
        1)
            maquina="Pedra"
            ;;
        2)
            maquina="Paper"
            ;;
        3)
            maquina="Tisores"
            ;;
    esac

    echo "Tu has triat: $jugador"
    echo "La màquina ha triat: $maquina"

    # Determinem el guanyador
    if [ "$jugador" == "$maquina" ]; then
        echo "Empat!"
    elif [ "$jugador" == "Pedra" -a "$maquina" == "Tisores" ] ||
         [ "$jugador" == "Paper" -a "$maquina" == "Pedra" ] ||
         [ "$jugador" == "Tisores" -a "$maquina" == "Paper" ]; then
        echo "Has guanyat!"
    else
        echo "Has perdut!"
    fi

    # Preguntem si l'usuari vol tornar a jugar
    read -p "Vols jugar de nou? (si/no): " jugar_de_nou
    if [ "$jugar_de_nou" != "si" ]; then
        echo "Adeu!"
        exit 0
    fi
done
