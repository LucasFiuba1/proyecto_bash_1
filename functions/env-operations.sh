#!/bin/bash

save_filename() {
    touch "$OUTPUT_DIR/$FILENAME.txt"
}

does_environment_exist() {
    [ -d "$INPUT_DIR" ] &&
    [ -d "$OUTPUT_DIR" ] &&
    [ -d "$PROCESSED_DIR" ]
}

create_environment() {
    if does_environment_exist; then
        echo "El entorno ya existe."
        return 1
    fi

    if ! mkdir -p "$INPUT_DIR" "$OUTPUT_DIR" "$PROCESSED_DIR"; then
        echo "ERROR: No se pudo crear el entorno." >&2
        return 1
    fi

	save_filename

    cp "$SCRIPT_DIR/consolidar.sh" "$BASE_DIR/consolidar.sh"
    chmod +x "$BASE_DIR/consolidar.sh"
    echo "Entorno creado correctamente en $BASE_DIR"
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
