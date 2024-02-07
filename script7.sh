#!/bin/bash

# Demanem a l'usuari que introdueixi la ruta d'un fitxer
read -p "Introdueix la ruta d'un fitxer: " path

# Comprovem si el fitxer existeix
if [ -e "$path" ]; then
    # Comprovem si és un directori o fitxer amb el parametre `-d` al path
    if [ -d "$path" ]; then
        echo "És un directori."
    else
        echo "És un fitxer."

        # Mostrem l'extensió del fitxer, busquem el punt final del nom del fitxer i
	#ho separem en dos valors (només funciona si té una extensió)
        filename=$(basename "$path")
        extension="${filename##*.}"
        echo "L'extensió del fitxer és: $extension"
    fi
else
    echo "Error: El fitxer no existeix o la ruta és incorrecta."
fi
