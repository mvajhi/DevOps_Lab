# Repository server
## In new ansible task we automate this services
## Deploy and config
### Prepare server
this ansible contain:
 - install and update basic app
 - hardening server (ssh,...)
 - install docker
 - pull docker image
 - set dns and mirror reg for docker and apt

set server user and ip in `./ansible/inventory/hosts.yml`

if server in iran you can set `labels=iran` to using dns and mirror reg

now you can run ansible:
```bash
ansible-playbook preparing.yaml -i inventory/hosts.yml
```

### Traefik
go to `./traefik` then set `.env` files to your main domain and set `.env_back` for replication server.
after set config in `traefik` dir, run docker compose:
```bash
# for main server
docker compose up -d
# for replicate server
docker compose --env-file .env_rep up -d
```
check service up. (for main check [traefik.mvajhi.ir](traefik.mvajhi.ir))

### MinIO
go to `./minio` then set `.env` files to your main domain and set `.env_back` for replication server.
after set config in `minio` dir, run docker compose:
```bash
# for main server
docker compose up -d
# for replicate server
docker compose --env-file .env_rep up -d
```
check service up. (for main check [objects.mvajhi.ir](objects.mvajhi.ir))

### Config MinIO
after install MinIO Client ([guid](https://min.io/docs/minio/linux/reference/minio-mc.html?ref=docs#install-mc)) set alias:
```bash
 mc alias set ALIAS HOSTNAME ACCESS_KEY SECRET_KEY
# example
 mc alias set obj https://api.objects.mvajhi.ir mahdi 12345678
 mc alias set rep-obj https://api.objects.back.mvajhi.ir mahdi 12345678
```
now config replication:
```bash
mc admin replicate add obj rep-obj
```