#!/bin/bash

source "./constants.sh"
source "./env-operations.sh"

list_students_by_number() {
    if does_outputfile_exist; then
        return 1
    fi

    echo -e "\nAlumnos ordenados por número de padrón:"
    echo "--------------------------------------"

    sort -n -k1,1 "$OUTPUT_FILE"
}

show_top_grades() {
    ...
}

find_student_by_id() {
    ...
}
