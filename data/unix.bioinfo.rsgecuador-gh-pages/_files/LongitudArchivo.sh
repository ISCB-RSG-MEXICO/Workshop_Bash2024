#!/bin/bash

# Directorio donde se encuentran los archivos FASTQ

# Loop para procesar cada archivo FASTQ
for archivo in *.fastq; do
  if [ -f "$archivo" ]; then
    echo "Procesando archivo: $archivo"

    # Inicializar contador de longitudes
    longitudes=()

    # Leer el archivo línea por línea
    contador=0
    while IFS= read -r linea; do
      ((contador++))
      
      # Solo procesamos las líneas de secuencias (segunda línea de cada bloque)
      if ((contador % 4 == 2)); then
        # Agregar la longitud de la secuencia al array
        longitudes+=(${#linea})
      fi
    done < "$archivo"

    # Calcular la distribución de longitudes
    echo "Distribución de longitudes para $archivo:"
    for longitud in "${longitudes[@]}"; do
      echo -n "$longitud "  # Imprimir todas las longitudes
    done

    echo -e "\nNúmero total de secuencias: ${#longitudes[@]}"

    # Opcional: generar un histograma (puedes ajustarlo según el rango de longitudes)
    echo "Histograma de longitudes de secuencias:"
    for longitud in "${longitudes[@]}"; do
      echo "$longitud"
    done | sort | uniq -c | sort -n  # Ordena y cuenta las frecuencias

  else
    echo "El archivo $archivo no existe."
  fi
done
