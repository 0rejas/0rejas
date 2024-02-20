#!/bin/bash

# Comprobem si el nombre de parámetres es igual a 3 utilitzant until
until [ "$#" -eq 3 ]; do
    echo "Error: Has d'introduir exactament 3 paràmetres."
    echo "Introdueix els paràmetres correctes:"
    read -a params
    set -- "${params[@]}"
done

# Mostrem un missatge  d'exit
echo "Has introduït 3 paràmetres amb èxit."
echo "Paràmetres introduïts: $1, $2, $3"
