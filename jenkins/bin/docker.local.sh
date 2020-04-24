#!/bin/sh
docker run --rm -it \
  --name jenkins \
  -u root \
  -p 8080:8080 \
  -p 50000:50000 \
  -v $HOME:/root \
  -v $(pwd)/data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts 
