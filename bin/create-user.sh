#!/usr/bin/env bash

if [[ $# -lt 2 ]]; then
    echo "usage: create-user.sh {username} {password}"
    exit 1
fi

podman -r run -it --rm --network db --secret postgres_connection,type=env,target=CONN docker.io/postgres \
    bash -c 'psql $CONN -q -c "CREATE USER '"$1"' WITH ENCRYPTED PASSWORD '"'$2'"';"'
