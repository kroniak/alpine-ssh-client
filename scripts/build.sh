#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || {
    echo >&2 "This script requires the docker to be installed"
    exit 1
}

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.18 "$SCRIPT_ROOT/../3.18"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.19 "$SCRIPT_ROOT/../3.19"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.20 "$SCRIPT_ROOT/../3.20"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.21 "$SCRIPT_ROOT/../3.21"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:latest "$SCRIPT_ROOT/.."
