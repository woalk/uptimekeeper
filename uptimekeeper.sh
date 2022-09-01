#!/bin/bash

SAVE_PWD=${1:-"${HOME}/.uptimekeeper"}

echo "Started $0. PID: $$"

if [ ! -d "$SAVE_PWD" ]; then
    echo "WARNING: ${SAVE_PWD} does not exist. Creating directory."
    mkdir -p "$SAVE_PWD"
fi

onExit() {
    ((date -I | tr -d '\n') && uptime) >> "${SAVE_PWD}/$(date +%Y-%m).txt"
}

trap onExit EXIT
read -u 2
echo "ERROR: Read >0 from stderr" >&2
exit 1
