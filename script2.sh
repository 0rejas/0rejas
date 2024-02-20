#!/bin/bash

# Comprovem si s'ha proporcionat un nom d'usuari com a paràmetre
if [ -z "$1" ]; then
    echo "Si us plau, introdueix un nom d'usuari com a paràmetre."
    exit 1
fi

# Nom d'usuari proporcionat com a paràmetre i l'uid de l'usuari que utilitzarem més endevant
username="$1"
uid=$(id -u "$username")
while true; do
    # Menú d'opcions
    echo "1. Comprovar drets d'administrador"
    echo "2. Comprovar si l'usuari existeix"
    echo "3. Comprovar si la ruta del directori personal és vàlida"
    echo "4. Sortir"

    # Llegim la opció de l'usuari
    read -p "Selecciona una opció (1-4): " option

    # Fem servir un case per gestionar les opcions
    case $option in
        1)
            # Comprovem drets d'administrador amb l'uid abans definit(sabem que si l'uid=0 és usuari root/ amb permisos)
            if [ "$uid" -eq 0 ]; then
                echo -e "L'usuari té drets d'administrador $uid.\n"
            else
                echo -e "L'usuari no té drets d'administrador.\n"
            fi
            ;;
        2)
            # Comprovem si l'usuari existeix
            if id "$username" &>/dev/null; then
                echo -e "L'usuari $username existeix.\n"
            else
                echo -e "L'usuari $username no existeix.\n"
            fi
            ;;
        3)
            # Comprovem si la ruta del directori personal és vàlida
            if [ -d "/home/$username" ]; then
                echo -e "La ruta del directori personal per $username és vàlida.\n"
            else
                echo -e "La ruta del directori personal per $username no és vàlida.\n"
            fi
            ;;
        4)
            # Sortir del bucle i del script
            echo -e "Adéu siau!\n"
            exit 0
            ;;
        *)
            # Opció no vàlida
            echo -e "Opció no vàlida. Si us plau, selecciona una opció vàlida (1-4).\n"
            ;;
    esac
done

