#!/bin/bash

save_filename() {
    touch "$OUTPUT_FILE"
}

does_environment_exist() {
    [ -d "$INPUT_DIR" ] &&
        [ -d "$OUTPUT_DIR" ] &&
        [ -d "$PROCESSED_DIR" ] &&
        [ -f "$BASE_DIR/consolidar.sh" ]
}

does_outputfile_exist() {
    [ -s "$OUTPUT_FILE" ]
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

    if ! cp "$SCRIPT_DIR/consolidar.sh" "$BASE_DIR/consolidar.sh"; then
        echo "ERROR: No se pudo copiar consolidar.sh." >&2
        return 1
    fi
    chmod +x "$BASE_DIR/consolidar.sh"

    echo "Entorno creado correctamente en $BASE_DIR"
}

delete_environment() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")

        if kill -0 "$PID" 2>/dev/null; then
            kill "$PID"
            echo "Proceso consolidar.sh finalizado."
        fi
    fi

    if [ -d "$BASE_DIR" ]; then
        rm -rf "$BASE_DIR"
        echo "Entorno EPNro1 eliminado."
    else
        echo "El entorno EPNro1 no existe."
    fi
}

validate_filename_env_variable() {
    if [ -z "$FILENAME" ]; then
        echo "ERROR: La variable de entorno FILENAME no esta definida."
        echo "Ejemplo:"
        echo "export FILENAME=alumnos"
        exit 1
    fi
}
