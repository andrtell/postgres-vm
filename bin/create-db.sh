#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
    echo "usage: create-db.sh {name}"
    exit 1
fi

podman -r run -it --rm --network db --secret postgres_connection,type=env,target=CONN docker.io/postgres \
    bash -c 'psql $CONN -q -c "CREATE DATABASE '"$1"';"'
