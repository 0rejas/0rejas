#!/bin/bash

# Demanem a l'usuari que introdueixi la ruta d'un fitxer
read -p "Introdueix la ruta d'un fitxer: " path

# Comprovem si el fitxer existeix com a l'erxercici anterior
if [ -e "$path" ]; then
    # Mostrem els permisos del fitxer amb els següents parametres: stat i -c
    permisos=$(stat -c "%A" "$path")
    echo "Els permisos del fitxer són: $permisos"
else
    echo "Error: El fitxer no existeix o la ruta és incorrecta."
fi
