#!/bin/bash

source "./constants.sh"
source "$FUNCTIONS_DIR/env-operations.sh"

list_students_by_number() {
    if does_outputfile_exist; then
        echo -e "\nAlumnos ordenados por número de padrón:"
        echo "--------------------------------------"

        sort -n -k1,1 "$OUTPUT_FILE"
    else
        echo "El archivo $OUTPUT_FILE no existe."
        return 1
    fi
}

show_top_grades() {
    if does_outputfile_exist; then
        sort -k 5nr "$OUTPUT_FILE" | head -n 10
    else
        echo "El archivo $FILENAME.txt no existe"
    fi
}

find_student_by_id() {
    ...
}
