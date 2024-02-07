#!/bin/bash

# Demanem a l'usuari que introdueixi un nombre enter
read -p "Introdueix un nombre enter: " num

# Comprovar si el nombre és negatiu utilitzant un `if` per veure si es menor a 0
if [ "$num" -lt 0 ]; then
    echo "El nombre és negatiu."
else
    echo "El nombre no és negatiu."
fi
