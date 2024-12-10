#!/bin/bash
# GC_per.sh

# Directorio donde están los archivos FASTQ
directorio="$HOME/unix.bioinfo.rsgecuador-gh-pages/_files"

# Loop para procesar cada archivo FASTQ
for archivo in "$directorio"/*.fastq; do
  if [ -f "$archivo" ]; then
    echo "Procesando archivo: $archivo"

    # Inicializar contadores
    total_bases=0
    gc_bases=0

    # Leer el archivo línea por línea
    contador=0
    while IFS= read -r linea; do
      ((contador++))
      
      # Solo procesamos las líneas de secuencias (segunda línea de cada bloque)
      if ((contador % 4 == 2)); then
        # Contamos las bases G y C
        gc_bases=$((gc_bases + $(echo "$linea" | grep -o 'G' | wc -l) + $(echo "$linea" | grep -o 'C' | wc -l)))
        total_bases=$((total_bases + ${#linea}))
      fi
    done < "$archivo"

    # Calculamos el porcentaje de GC
    if [ "$total_bases" -gt 0 ]; then
      porcentaje_gc=$((gc_bases * 100 / total_bases))
      echo "Porcentaje de GC en $archivo: $porcentaje_gc%"
    else
      echo "No se encontraron secuencias válidas en $archivo."
    fi
  else
    echo "El archivo $archivo no existe."
  fi
done
