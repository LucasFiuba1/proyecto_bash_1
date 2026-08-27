#!/bin/bash

run_process() {
    if ! does_environment_exist; then
        echo "El entorno no existe."
        retun 1
    fi

    "$BASE_DIR/consolidar.sh"
}

show_log() {
    ...
}