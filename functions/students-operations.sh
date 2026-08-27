#!/bin/bash

source "./constants.sh"
source "$FUNCTIONS_DIR/env-operations.sh"

list_students_by_number() {
    if does_outputfile_exist; then
        echo -e "\nAlumnos ordenados por número de padrón:"
        echo "--------------------------------------"
        sort -n -k1,1 "$OUTPUT_FILE"
        echo "--------------------------------------"
    else
        echo "El archivo $OUTPUT_FILE no existe."
        return 1
    fi
}

show_top_grades() {
    if does_outputfile_exist; then
        echo -e "\nAlumnos ordenados por nota más alta:"
        echo "--------------------------------------"
        sort -k 5nr "$OUTPUT_FILE" | head -n 10
        echo "--------------------------------------"
    else
        echo "El archivo $FILENAME.txt no existe"
    fi
}

find_student_by_id() {
    read -r -p "Ingrese numero de padrón: " padron
    if does_outputfile_exist; then
        if ! grep -wq "$padron" "$OUTPUT_FILE"; then
            echo "No se encontro a ningun alumno/a con el numero de padrón $padron"
        else
            echo -e "\n Alumno con el numero de padron:"
            grep -w "$padron" "$OUTPUT_FILE"
        fi
    else
        echo "El archivo $FILENAME.txt no existe"
    fi
}
