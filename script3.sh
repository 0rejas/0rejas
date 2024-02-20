#!/bin/bash

# Demanem a l'usuari el nom de l'arxiu
echo "Introdueix el nom de l'arxiu per emmagatzemar les paraules:"
read nom_arxiu

# Verifiquem si ja existeix un arxiu amb aquest nom
if [ -f "$nom_arxiu" ]; then
    echo "L'arxiu ja existeix. S'utilitzarà l'arxiu existent."
else
    # Si l'arxiu no existeix, creem un nou arxiu
    touch "$nom_arxiu"
    echo "S'ha creat l'arxiu $nom_arxiu."
fi

# Fem servir el bucle while per llegir paraules i guardar-les a l'arxiu fins que es troba ":>"
echo "Introdueix paraules (escriu ':>' per finalitzar):"
while true; do
    read paraula
    if [ "$paraula" == ":>" ]; then
        echo "S'ha finalitzat la introducció de paraules. Sortint del bucle."
        break
    else
        echo "$paraula" >> "$nom_arxiu"
    fi
done

echo "Operació completada. Les paraules s'han guardat a l'arxiu $nom_arxiu."
