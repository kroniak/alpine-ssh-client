#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || {
    echo >&2 "This script requires the docker to be installed"
    exit 1
}

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t kroniak/ssh-client:3.12 "$SCRIPT_ROOT/../3.12"
docker build -t kroniak/ssh-client:3.13 "$SCRIPT_ROOT/../3.13"
docker build -t kroniak/ssh-client:3.14 "$SCRIPT_ROOT/../3.14"
docker build -t kroniak/ssh-client:3.15 "$SCRIPT_ROOT/../3.15"
docker build -t kroniak/ssh-client:latest "$SCRIPT_ROOT/.."
