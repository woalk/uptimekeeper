#!/bin/bash

# Copyright 2022 Alexander Köster
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SAVE_PWD=${1:-"${HOME}/.uptimekeeper"}
M_DELIM=${2:-"-"}
FILE_SUFFIX=${3:-".txt"}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo """USAGE: $0 (-h|--help) [directory] [month-delimiter] [suffix]
OPTIONS:
  -h | --help      Display this usage message.
PARAMETERS:
  directory:       The directory to save the tracking files to.
                   DEFAULT: '\$HOME/.uptimekeeper'
  month-delimiter: The delimiter between year and month.
                   Use '/' to create directories for each year.
                   DEFAULT: '-' (e.g. 2022-09.txt)
  suffix:          A suffix to append to every file name.
                   DEFAULT: '.txt'"""
    exit 0
fi

echo "Started $0. PID: $$"

if [ ! -d "$SAVE_PWD" ]; then
    echo "WARNING: ${SAVE_PWD} does not exist. Creating directory."
    mkdir -p "$SAVE_PWD"
fi

onExit() {
    if [[ ${M_DELIM} == *"/"* ]]; then
        mkdir -p "${SAVE_PWD}/$(date +%Y${M_DELIM})"
    fi
    ((date -I | tr -d '\n') && uptime) >> "${SAVE_PWD}/$(date +%Y${M_DELIM}%m)${FILE_SUFFIX}"
}

trap onExit EXIT
sleep infinity
exit 1
