# Repository server
## Design
![diagram]()
## Deploy and config
### Prepare server
this ansible contain:
 - install and update basic app
 - hardening server (ssh,...)
 - install docker
 - pull docker image
 - set dns and mirror reg for docker and apt
 - deploy traefik
 - deploy MinIO
 - deploy nexus

set server user and ip in `./ansible/inventory/hosts.yml`

if server in iran you can set `labels=iran` to using dns and mirror reg

now you can run ansible:
```bash
ansible-playbook preparing.yaml -i inventory/hosts.yml
```