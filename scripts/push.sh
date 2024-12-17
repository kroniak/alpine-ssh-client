#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || {
    echo >&2 "This script requires the docker to be installed"
    exit 1
}

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"$SCRIPT_ROOT"/build.sh

docker push kroniak/ssh-client:3.18
docker push kroniak/ssh-client:3.19
docker push kroniak/ssh-client:3.20
docker push kroniak/ssh-client:3.21
docker push kroniak/ssh-client:latest
