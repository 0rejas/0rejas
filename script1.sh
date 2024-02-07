#!/bin/bash

# Demanem a l'usuari que introdueixi un nombre enter
read -p "Introdueix un nombre enter: " num

# Comprovem si el nombre és positiu, negatiu o zero amb un `if,elif` i `grater than/lower than`
if [ "$num" -gt 0 ]; then
    echo "El nombre és positiu."
elif [ "$num" -lt 0 ]; then
    echo "El nombre és negatiu."
else
    echo "El nombre és zero."
fi
