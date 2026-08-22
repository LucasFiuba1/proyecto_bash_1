#!/bin/bash

create_environment() {
    ...
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
