#!/bin/bash

# Demanem a l'usuari que introdueixi un nombre enter
read -p "Introdueix un nombre enter: " num

# Comprovem si el nombre és zero amb un `if` per saber si es igual (-eq)
if [ "$num" -eq 0 ]; then
    echo "El nombre és zero."
else
    echo "El nombre no és zero."
fi
