#!/bin/bash

source "./constants.sh"
source "$FUNCTIONS_DIR/env-operations.sh"

run_process() {
    if ! does_environment_exist; then
        echo "El entorno no existe."
        return 1
    fi

    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")

        if kill -0 "$PID" 2>/dev/null; then
            echo -e "\nEl proceso consolidar.sh ya está ejecutándose."
            echo "PID: $PID"
            return 1
        else
            rm -f "$PID_FILE"
        fi
    fi

    "$BASE_DIR/consolidar.sh" &

    PID=$!

    echo "$PID" >"$PID_FILE"

    echo -e "\nProceso consolidar.sh iniciado en background."
    echo "PID: $PID"
}

show_log() {
    if does_environment_exist; then
        if [ -f "$LOG_FILE" ]; then
            echo -e "\n"
            cat "$LOG_FILE"
        else
            echo "El archivo $LOG_FILE no existe"
        fi
    else
        echo "El entorno no existe"
    fi
}
