# Postgres VM

VM with postgres

## Treafik VM

Setup you VM using [traefik-vm](https://github.com/andrtell/traefik-vm).

## Ansible

Create the file `inventory.yaml`.

```
ungrouped:
  hosts:
    vm:
      ansible_host: vm01
```

## Postgres VM

Run the playbook `playbooks/01_postgres.yaml`.

```
ansible-playbook -i inventory.yaml --extra-vars "postgres_password=$POSTGRES_PASSWORD" playbooks/01_postgres.yaml
```

Note that the password will only be used once when the db is created. On subsequent runs of the playbook,
no database will be created, and thus the old password will remain in place.

## PSQL

Connect to the postgres server using `psql`.

```
podman -r run -it --rm --network db --secret postgres_connection,type=env,target=CONN docker.io/postgres bash -c 'psql $CONN'
```
