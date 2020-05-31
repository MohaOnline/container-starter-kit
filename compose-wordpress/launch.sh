#!/bin/bash

# Enable Docker Content Trust
export DOCKER_CONTENT_TRUST=1

# Initialize Docker Swarm mode
docker swarm init

# Read input parameters
read -sp "Enter MySQL root password: " MYSQL_ROOT_PASSWORD
echo
echo $MYSQL_ROOT_PASSWORD | docker secret create mysql_root_password -

read -sp "Enter Prometheus MySQL Exporter user password: " EXPORTER_PASSWORD
echo
echo $EXPORTER_PASSWORD | docker secret create exporter_password -

# Generate random password for Wordpress-MySQL connection
openssl rand -base64 20 | docker secret create mysql_password -

# Create directory for Wordpress volume
mkdir -p volumes/wordpress_data
sudo chown -R 33:33 volumes/wordpress_data
sudo chmod 2770 volumes/wordpress_data

# Create directory for MySQL volume
# 999 stands for MySQL user
mkdir -p volumes/db_data
sudo chown -R 999:999 volumes/db_data
sudo chmod 2770 volumes/db_data

# Generate nginx self-signed certificate/key and store it as Docker Secrets
mkdir certs
openssl req -newkey rsa:4096 -nodes -sha256 -x509 -days 365 \
    -subj '/CN=scw-dev-blog.org/O=SCW/C=AU' \
    -keyout certs/nginx.key \
    -out certs/nginx.crt
docker secret create nginx_cert certs/nginx.crt
docker secret create nginx_key certs/nginx.key
rm -rf certs/

# Create a private local Docker Registry service
docker service create \
    --name scw-local-registry \
    --publish published=5000,target=5000 \
    registry:2

# Build docker images and upload to private local registry
docker-compose build 
docker-compose push

# Deploy to Docker Swarm
docker stack deploy --compose-file docker-compose.yml scw_dev_blog


