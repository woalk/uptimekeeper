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

echo "Started $0. PID: $$"

if [ ! -d "$SAVE_PWD" ]; then
    echo "WARNING: ${SAVE_PWD} does not exist. Creating directory."
    mkdir -p "$SAVE_PWD"
fi

onExit() {
    if [[ ${M_DELIM} == *"/"* ]]; then
        mkdir -p "${SAVE_PWD}/$(date +%Y${M_DELIM})"
    fi
    ((date -I | tr -d '\n') && uptime) >> "${SAVE_PWD}/$(date +%Y${M_DELIM}%m).txt"
}

trap onExit EXIT
read -u 2
echo "ERROR: Read >0 from stderr" >&2
exit 1
