#!/bin/bash

BASE_DIR="$HOME/EPNro1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

INPUT_DIR="$BASE_DIR/entrada"
OUTPUT_DIR="$BASE_DIR/salida"
PROCESSED_DIR="$BASE_DIR/procesado"

LOG_FILE="$BASE_DIR/procesado.log"
PID_FILE="$BASE_DIR/consolidar.pid"

FUNCTIONS_DIR="$SCRIPT_DIR/functions"

source "$FUNCTIONS_DIR/env-operations.sh"
source "$FUNCTIONS_DIR/process-operations.sh"
source "$FUNCTIONS_DIR/students-operations.sh"

while true; do
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
