#!/bin/bash

# Mostra els arguments un per un
echo "Arguments introduïts:"
for arg in "$@"; do
    echo "$arg"
done

# Mostra la quantitat d'arguments
echo "S'han introduït $# arguments."
