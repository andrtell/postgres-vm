#!/usr/bin/env bash

if [[ $# -lt 2 ]]; then
    echo "usage: grant-db.sh {db} {user}"
    exit 1
fi

podman -r run -it --rm --network db --secret postgres_connection,type=env,target=CONN docker.io/postgres \
    bash -c 'psql $CONN'"/$1"' -q -c "GRANT pg_read_all_data TO '"$2"'; GRANT pg_write_all_data to '"$2"'; GRANT CREATE ON SCHEMA public TO '"$2"';"'
