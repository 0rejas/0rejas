#!/bin/bash

# Obtenim noms de comptes d'usuari amb lletres majúscules
usuaris_amb_majuscules=$(grep -E '^[[:upper:]]' /etc/passwd | cut -d: -f1)

# Imprimim els noms de comptes amb majúscules
echo "Comptes d'usuari amb majúscules: $usuaris_amb_majuscules"

# Demanem a l'usuari que introdueixi un nom d'usuari
while true; do
    echo "Introdueix un nom d'usuari:"
    read nom_usuari

    # Verifiquem si el nom d'usuari és vàlid (existeix)
    if id "$nom_usuari" &>/dev/null; then
        break
    else
        echo "Error: El nom d'usuari no és vàlid. Torna-ho a provar."
    fi
done

# Mostrem tota la informació relacionada amb el compte d'usuari
echo "Informació del compte d'usuari $nom_usuari:"
id "$nom_usuari"
passwd -S "$nom_usuari"
