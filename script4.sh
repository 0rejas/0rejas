#!/bin/bash

# Comprovem si el nombre del paràmetre és igual a 3 amb un `if` i `eq`.
if [ "$#" -eq 3 ]; then
    echo "El nombre és igual a 3."
else
    echo "Error: El nombre no és igual a 3."
fi
