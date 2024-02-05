#!/bin/bash

# Solicita al usuari que introdueixi un nom d'usuari
read -p "Introdueix el teu nom d'usuari: " username

# Solicita al usuari que introdueixi una contrasenyaa de forma segura (sense mostrarla en pantalla)
read -s -p "Introdueix la teva contrasenya: " password

# Mostra el nom d'usuari i la password en una linia (no es la password real).
echo -e "\nNombre de usuario: $username, Contraseña: ********"
