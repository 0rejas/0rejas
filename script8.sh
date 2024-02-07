#!/bin/bash

# Demanem a l'usuari que introdueixi la ruta d'un directori i el nom de l'arxiu tar
read -p "Introdueix la ruta del directori a comprimir: " dir_path
read -p "Introdueix el nom de l'arxiu de tar (amb extensió .tar): " tar_name

# Comprimim el directori amb tar posant els parametres en la comanda
tar -cvf "$tar_name" "$dir_path"

echo "S'ha creat l'arxiu tarball: $tar_name"
