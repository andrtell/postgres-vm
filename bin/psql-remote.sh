#!/usr/bin/env bash

if ! [[ -z "$1" ]]; then
    DB="/$1"
fi

if ! [[ -z "$2" ]]; then
    ARGS=${@:2}
fi

podman -r run -it --rm --network db --secret postgres_connection,type=env,target=CONN docker.io/postgres bash -c 'psql $CONN'"$DB $ARGS"
