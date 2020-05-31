#!/bin/bash

docker network create scw-network
docker run -d --net scw-network --name scw-redis redis:5
docker build -t scw-http .
docker run -d -p 10080:443 --net scw-network --name scw-http scw-http
