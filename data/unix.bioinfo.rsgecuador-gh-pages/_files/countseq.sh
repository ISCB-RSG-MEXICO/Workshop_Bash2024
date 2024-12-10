#!/bin/bash
# File: countseq.sh

# Ruta a la carpeta que contiene los archivos .fastq
FOLDER="_files"

# Iterar sobre cada archivo .fastq en la carpeta
for file in "$FOLDER"/*[1-3].fastq; do
  # Imprimir el nombre del archivo
  echo "Archivo: $file"
  
  # Usar grep para buscar secuencias que contengan 10 'N' seguidas y contar cuántas veces aparecen
  count=$(grep -c 'NNNNNNNNNN' $file )
  
  # Imprimir el número de secuencias encontradas
  echo "Número de secuencias con 10 N seguidas: $count"
  echo "---------------------------------------"
done
