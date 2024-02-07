#!/bin/bash

# Verifiquem que s'han proporcionat els paràmetres necessaris (arxiu i protocol a buscar (en mayuscules))
if [ $# -lt 2 ]; then
    echo "Ús: $0 arxiu_captures.txt/csv protocol"
    exit 1
fi

# Assignem els valors corresponents als paràmetres seguents:
arxiu=$1
protocol=$2

# Comprovem si l'arxiu existeix amb uns `if`
if [ ! -f "$arxiu" ]; then
    echo "L'arxiu $arxiu no existeix."
    exit 1
fi

# Comptem les connexions per al protocol que volem buscar amb un grep a l'arxiu
num_connexions=$(grep -c "$protocol" "$arxiu")

# Finalment mostrem el resultat
echo "S'han establert $num_connexions connexions amb el protocol $protocol a l'arxiu $arxiu."
