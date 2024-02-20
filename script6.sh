#!/bin/bash

# Demanem al usuari la ruta del directori
echo "Introdueix la ruta del directori:"
read directori

# Verifiquem si el directorio existeix
if [ -d "$directori" ]; then
    # Mostrem els permisos del directori
    permisos=$(ls -ld "$directori" | awk '{print $1}')
    echo "Permisos del directori: $permisos"

    # Comptem la quantitat d'arxius i carpetes
    num_arxius=$(find "$directori" -maxdepth 1 -type f | wc -l)
    num_carpetes=$(find "$directori" -maxdepth 1 -type d | wc -l)

    echo "Quantitat d'arxius: $num_arxius"
    echo "Quantitat de carpetes: $num_carpetes"

    # Llistem els nombres d'arxius i carpetes
    echo "Noms d'arxius i carpetes:"
    ls -a "$directori"
else
    echo "Error: El directori no existeix."
fi
