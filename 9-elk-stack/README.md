# ELK Stack Deployment Guide

This guide provides instructions for deploying the ELK stack (Elasticsearch, Logstash, Kibana, and Fleet) using Ansible and Docker Compose.

## Introduction

The ELK stack is a powerful set of tools for collecting, processing, and visualizing log data. This guide will walk you through the process of deploying the ELK stack using Ansible and Docker Compose.

## Design
![diagram](https://github.com/mvajhi/DevOps_Lab/blob/main/9-elk-stack/Diagram.drawio.png?raw=true)

## Prerequisites

- Ensure you have Ansible installed on your local machine.
- Ensure you have Docker and Docker Compose installed on the target server.

## Installation

### Step 1: Set Up Environment Variables

1. Navigate to the `9-elk-stack/services/elk` directory.
2. Open the `.env` file and set the necessary environment variables. For example:

```env
ELASTICSEARCH_VERSION=7.17.13
LOGSTASH_VERSION=7.17.13
KIBANA_VERSION=7.17.13
FLEET_VERSION=7.17.13
HOSTNAME=elk-server

DOMAIN=obs.mvajhi.ir
ELASTIC_SUB_DOMAIN=es
KIBANA_SUB_DOMAIN=kibana
LOGSTASH_SUB_DOMAIN=logstash
FLEET_SUB_DOMAIN=fleet

ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=Mahdi1234

ELASTIC_HOSTNAME=http://elasticsearch:9200
KIBANA_HOSTNAME=http://kibana:5601
```

### Step 2: Run Ansible Playbooks

1. Navigate to the `9-elk-stack/ansible` directory.
2. Run the `preparing.yaml` playbook to prepare the server:

```sh
ansible-playbook -i inventory/hosts.yml preparing.yaml
```

3. Run the `main.yaml` playbook to deploy the ELK stack:

```sh
ansible-playbook -i inventory/hosts.yml roles/deploy_tools/tasks/main.yaml
```

### Step 3: Start ELK Stack Services

1. Navigate to the `9-elk-stack/services/elk` directory.
2. Run the Docker Compose configuration to start the ELK stack services:

```sh
docker-compose up -d
```

## Configuration

### Step 4: Deploy Beats and Agent

1. Navigate to the `9-elk-stack/services/elk/beats` directory.
2. Open the `.env` file and set the necessary environment variables. For example:

```env
# domain name information
DOMAIN_NAME=obs.mvajhi.ir
ELASTICSEARCH_SUB_DOMAIN=es
KIBANA_SUB_DOMAIN=kibana
FLEET_SUB_DOMAIN=fleet

# hostname
HOSTNAME=elk-server

# elk version
ELK_VERSION=7.17.13

# elasticserch auth
ELASTICSEARCH_USERNAME=elastic
ELASTICSEARCH_PASSWORD=Mahdi1234

# apm secret token
ELASTICSEARCH_APM_SECRET_TOKEN=hNA6iQxwNcgZse2vZm4iLHhothC77Jscdsee

# elasticsearch and kibana url
ELASTICSEARCH_HOSTNAME=http://elasticsearch:9200
KIBANA_HOSTNAME=http://kibana:5601
KIBANA_PUBLIC_URL=https://${KIBANA_SUB_DOMAIN}.${DOMAIN_NAME}

# set restart policy
RESTART_POLICY=on-failure
```

3. Run the Docker Compose configuration to start the Beats services:

```sh
docker-compose up -d
```

4. Navigate to the `9-elk-stack/services/elk-agent` directory.
5. Open the `.env` file and set the necessary environment variables. For example:

```env
ELK_VERSION=7.17.13
HOSTNAME=elk-agent
DOMAIN=obs.mvajhi.ir
FLEET_ENROLLMENT_TOKEN=<your_fleet_enrollment_token>
FLEET_URL=https://fleet.obs.mvajhi.ir:8220
```

6. Run the Docker Compose configuration to start the Elastic Agent:

```sh
docker-compose up -d
```

## Deployment

### Step 5: Connect Agent from Secondary Server to Main Server and Obtain Enrollment Token

1. On the secondary server, navigate to the `9-elk-stack/services/elk-agent` directory.
2. Open the `.env` file and set the necessary environment variables as mentioned in Step 4.
3. Run the Docker Compose configuration to start the Elastic Agent:

```sh
docker-compose up -d
```

4. Navigate to the Kibana UI (e.g., `https://kibana.obs.mvajhi.ir`).
5. Log in using the credentials specified in the `.env` file.
6. Go to the Fleet section and follow the instructions to obtain the enrollment token for the Elastic Agent.

To obtain the enrollment token in Kibana, follow these steps:
1. Log in to Kibana.
2. Click on the "Fleet" tab in the left-hand menu.
3. Click on the "Agents" tab.
4. Click on the "Add agent" button.
5. Follow the instructions to obtain the enrollment token.
6. Copy the enrollment token and place it in the `FLEET_ENROLLMENT_TOKEN` variable in the `.env` file of the Elastic Agent.

## Troubleshooting

If you encounter any issues during the deployment process, refer to the following troubleshooting steps:

- Ensure that all environment variables are set correctly in the `.env` files.
- Check the logs of the ELK stack services using the `docker-compose logs` command.
- Verify that the Ansible playbooks ran successfully without any errors.
- Ensure that the Docker Compose configuration files are correctly set up.

## Conclusion

You have successfully deployed the ELK stack using Ansible and Docker Compose. The ELK stack services should now be running and accessible based on the configured environment variables.
