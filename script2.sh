#!/bin/bash

# Verificar si s'han proporcionat els 5 argumentos
if [ "$#" -ne 5 ]; then
    echo "Error: Has de proporcionar 5 arguments."
    exit 1
fi

# Mostra els 5 arguments
echo "Els 5 arguments proporcionats son: $1 $2 $3 $4 $5"

# Mostra el nom del script
echo "Nom del script: $0"
