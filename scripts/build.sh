#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || {
    echo >&2 "This script requires the docker to be installed"
    exit 1
}

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.12 "$SCRIPT_ROOT/../3.12"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.13 "$SCRIPT_ROOT/../3.13"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.14 "$SCRIPT_ROOT/../3.14"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.15 "$SCRIPT_ROOT/../3.15"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.16 "$SCRIPT_ROOT/../3.16"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.17 "$SCRIPT_ROOT/../3.17"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:3.18 "$SCRIPT_ROOT/../3.18"
docker buildx build --platform linux/amd64 -t kroniak/ssh-client:latest "$SCRIPT_ROOT/.."
