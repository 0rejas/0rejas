#!/bin/bash

# Mostra les principals variables globals
echo "Variables Globals:"
echo "-------------------"
echo "Usuari actual: $USER"
echo "Nom del host: $HOSTNAME"
echo "Directori actual: $PWD"
echo "-------------------"
echo

# Mostra els arguments del shell
echo "Arguments del Shell:"
echo "----------------------"
echo "$@"
echo "----------------------"
echo
funcio() {
 echo "Valor de funcio= $HOSTNAME"
}
# Mostra el valor de l'anterior comanda
valor_retornat=$(funcio)
echo "Valor retornat per la última funció: $valor_retornat"
echo

# Mostra el PID de la shell actual
echo "PID de la Shell actual: $$"

