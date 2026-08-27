#!/bin/bash

source "./constants.sh"

while true; do
    echo "proceso corriendo"

    for file in "$INPUT_DIR"/*.txt; do
    
	    [ -f "$file" ] || continue

        file_name=$(basename "$file")

        cat "$file" >> "$OUTPUT_FILE"

        if mv "$file" "$PROCESSED_DIR/"; then

            fecha=$(date "+%d/%m/%Y %H:%M:%S")
        
		    echo "$fecha - Procesado archivo $file_name" >> "$LOG_FILE"
        
		else
        
		    echo "Error al mover el archivo $file_name."
        
		fi
    
	done

    sleep 30
done