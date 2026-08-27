#!/bin/bash

BASE_DIR="$HOME/EPNro1"

INPUT_DIR="$BASE_DIR/entrada"
OUTPUT_DIR="$BASE_DIR/salida"
PROCESSED_DIR="$BASE_DIR/procesado"

LOG_FILE="$BASE_DIR/procesado.log"
PID_FILE="$BASE_DIR/consolidar.pid"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FUNCTIONS_DIR="$SCRIPT_DIR/functions"

OUTPUT_FILE="$OUTPUT_DIR/$FILENAME.txt"

