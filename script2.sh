#!/bin/bash

# Demanem a l'usuari una cadena de nombres enters separats per espais
echo "Introdueix una cadena de nombres enters separats per espais:"
read cadena_nombres

# Inicialitzem el comptador de zeros
contador_zeros=0

# Utilitzem un bucle for per iterar sobre cada nombre de la cadena
for nombre in $cadena_nombres; do
    # Comprovem si el nombre és zero
    if [ "$nombre" -eq 0 ]; then
        ((contador_zeros++))
    fi
done

# Printem el resultat
echo "Hi ha $contador_zeros zeros a la cadena de nombres."
