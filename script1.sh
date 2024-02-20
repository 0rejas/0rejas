#!/bin/bash

# Demanem l'arxiu de l'usuari
read -p "Introdueix el nom de l'arxiu: " arxiu

# Comprovem si l'arxiu existeix
if [ ! -f "$arxiu" ]; then
    echo "L'arxiu no existeix."
    exit 1
fi

# Eliminem els comentaris de l'arxiu fent us del bucle for
for linia in $(cat $arxiu); do
    if [[ $linia != \#* ]]; then
        echo $linia >> temp_file
    fi
done
mv temp_file $arxiu

# Demanem a l'usuari la paraula/frase que vol buscar
read -p "Introdueix la paraula o frase a buscar: " paraula

# Comprovem si la paraula/frase existeix a l'arxiu
if grep -q "$paraula" $arxiu; then
    echo "La paraula o frase \"$paraula\" existeix a l'arxiu."
else
    echo "La paraula o frase \"$paraula\" no existeix a l'arxiu."
fi

# Afegim una frase al final de l'arxiu de forma obligatoria fent us d'un bulce while
while true; do
    read -p "Introdueix la frase a afegir a l'arxiu: " frase
    if [ -n "$frase" ]; then
        echo "$frase" >> $arxiu
        break
    else
        echo "És obligatori introduir una frase."
    fi
done
cat "$arxiu"
