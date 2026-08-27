#!/bin/bash

source "./constants.sh"
source "$FUNCTIONS_DIR/env-operations.sh"
source "$FUNCTIONS_DIR/process-operations.sh"
source "$FUNCTIONS_DIR/students-operations.sh"

if [ "$1" = "-d" ]; then
    delete_environment
	exit 0
fi

validate_filename_env_variable

option=""
while [ "$option" != "7" ]; do
    echo -e "\n======================================"
    echo "          PROYECTO FASE 1"
    echo "======================================"
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Mostrar alumnos ordenados por padrón"
    echo "4) Mostrar las 10 notas más altas"
    echo "5) Buscar alumno por padrón"
    echo "6) Visualizar log"
    echo "7) Salir"
    echo "======================================"

    read -r -p "Seleccione una opción: " option

    case "$option" in
        1)
            create_environment
            ;;
        2)
            run_process
            ;;
        3)
            list_students
            ;;
        4)
            show_top_grades
            ;;
        5)
            find_student_by_id
            ;;
        6)
            show_log
            ;;
        7)
            exit 0
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done
