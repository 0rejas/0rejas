#!/bin/bash

# Demanem a l'usuari que introdueixi la ruta d'un fitxer
read -p "Introdueix la ruta d'un fitxer: " path

# Comprovem si el fitxer existeix amb un `if` i el parametre `-e` per saber-lo
if [ -e "$path" ]; then
    echo "El fitxer existeix."
else
    echo "Error: El fitxer no existeix o la ruta és incorrecta."
fi
