#!/bin/bash

create_environment() {
    local input_dir="$1"
    local output_dir="$2"
    local processed_dir="$3"

    if [ -d "$input_dir" ] && [ -d "$output_dir" ] && [ -d "$processed_dir" ]; then
        echo "El entorno ya existe."
        exit 0
    fi

    if ! mkdir -p "$input_dir" "$output_dir" "$processed_dir"; then
        echo "ERROR: No se pudo crear el entorno." >&2
        exit 1
    fi

    echo "Entorno creado correctamente en $BASE_DIR"
    exit 0
}

delete_environment() {
    ...
}

validate_filename_env_variable() {
    if [ -z "$FILENAME" ]; then
        echo "ERROR: La variable de entorno FILENAME no esta definida."
        echo "Ejemplo:"
        echo "export FILENAME=alumnos"
        exit 1
    fi
}
