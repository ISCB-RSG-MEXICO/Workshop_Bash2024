#!/bin/bash
# File: countNseq.sh

# Ruta a la carpeta que contiene los archivos .fastq
FOLDER="_files"

# Iterar sobre cada archivo .fastq en la carpeta
for file in "$FOLDER"/*[1-3].fastq; do
  echo "Archivo: $file"
  
  # Usar grep para contar cuántas líneas empiezan con '@SRR098026'
  count=$(grep -c '^@SRR098026' $file )
  
  echo "Número de secuencias: $count"
  echo "---------------------------------------"
done
