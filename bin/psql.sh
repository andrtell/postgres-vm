#!/usr/bin/env bash

podman -r run -it --rm --network db --secret postgres_connection,type=env,target=CONN docker.io/postgres bash -c 'psql $CONN'
