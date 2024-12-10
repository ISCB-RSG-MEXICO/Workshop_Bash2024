#!/bin/bash

# Archivo de entrada
archivo="secuencias1.fastq"

# Inicializar contadores
conteo_A=0
conteo_T=0
conteo_G=0
conteo_C=0
conteo_N=0

# Leer el archivo línea por línea
contador=0
while IFS= read -r linea; do
  ((contador++))

  # Procesar solo líneas de secuencias (segunda línea de cada bloque de 4)
  if ((contador % 4 == 2)); then
    conteo_A=$((conteo_A + $(echo -n "$linea" | grep -o 'A' | wc -l)))
    conteo_T=$((conteo_T + $(echo -n "$linea" | grep -o 'T' | wc -l)))
    conteo_G=$((conteo_G + $(echo -n "$linea" | grep -o 'G' | wc -l)))
    conteo_C=$((conteo_C + $(echo -n "$linea" | grep -o 'C' | wc -l)))
    conteo_N=$((conteo_N + $(echo -n "$linea" | grep -o 'N' | wc -l)))
  fi
done < "$archivo"

# Mostrar resultados
echo "Contenido de bases en $archivo:"
echo "A: $conteo_A"
echo "T: $conteo_T"
echo "G: $conteo_G"
echo "C: $conteo_C"
echo "N: $conteo_N"
