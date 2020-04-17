#!/bin/sh

docker image rm -f node-app-hello
docker build -t node-app-hello .
