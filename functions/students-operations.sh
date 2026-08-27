#!/bin/bash

source "./constants.sh"
source "./env-operations.sh"

list_students_by_number() {
    if ! does_outputfile_exist; then
        echo "El archivo $OUTPUT_FILE no existe."
        return 1
    else
        echo -e "\nAlumnos ordenados por número de padrón:"
        echo "--------------------------------------"

        sort -n -k1,1 "$OUTPUT_FILE"
    fi
}

show_top_grades() {
    ...
}

find_student_by_id() {
    ...
}
