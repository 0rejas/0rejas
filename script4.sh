#!/bin/bash

# Bucle `for` que rep varis arguments i els printa
echo "Utilitzant \$*:"
for arg in $*; do
    echo "$arg"
done

echo "----------"

# Bucle `for` que rep varis arguments i els printa
echo "Utilitzant \$@:"
for arg in "$@"; do
    echo "$arg"
done

# Explicació de la diferencia netre $* i $@
echo "Explicació:"
echo "\$* representa tots els arguments com una sola paraula, mentres que \$@ manté cada argument com una paraula separada."
