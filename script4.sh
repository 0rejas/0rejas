#!/bin/bash

# Funció per comprovar l'estat d'un servidor remot
comprova_servidor() {
    local servidor="$1"
    local resultat=""
    
    # Fem ping als servidors¿?
    if ping -c 1 "$servidor"; then
        resultat="Actiu"
    else
        resultat="Inactiu"
    fi

    echo "Servidor $servidor: $resultat"
    echo "Servidor $servidor: $resultat" >> resultats.log
}

# Bucle per comprovar l'estat de cada servidor
comprova_servidors() {
    for servidor in "$@"; do
        comprova_servidor "$servidor"
    done
}

# Menú d'opcions
menu() {
    cat <<EOF
Opcions:
1. Comprovar estat de tots els servidors
2. Sortir
EOF
}

# Bucle principal
while true; do
    menu
    read -p "Selecciona una opció (1-2): " opcio

    case $opcio in
        1)
            comprova_servidors "servidor1" "servidor2" "servidor3"
            ;;
        2)
            echo "Adéu!"
            exit 0
            ;;
        *)
            echo "Opció no vàlida. Si us plau, selecciona una opció vàlida (1-2)."
            ;;
    esac
done

