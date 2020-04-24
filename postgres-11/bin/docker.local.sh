#!/bin/bash

docker rm -f postgres-11
docker rm -f pgadmin4

docker run -d --rm\
  --name postgres-11 \
  --net bridge \
  -p 5432:5432 \
  -v $(pwd)/postgres:/var/lib/postgresql/data \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  postgres:11

docker run -it --rm \
  --name pgadmin4 \
  -v $(pwd)/pgadmin:/var/lib/pgadmin \
  --net bridge \
  -p 8088:80 \
  -e PGADMIN_DEFAULT_EMAIL=root \
  -e PGADMIN_DEFAULT_PASSWORD=root \
  dpage/pgadmin4:4
  
