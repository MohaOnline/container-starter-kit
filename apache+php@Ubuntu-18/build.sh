#!/bin/bash

export DOCKER_CONTENT_TRUST=1

docker build -t http-server .

docker run -d -p 10443:10443 --name=http-server http-server

