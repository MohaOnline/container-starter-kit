FROM ubuntu:20.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt-get upgrade && apt install -y \
  curl \
  iputils-ping \
  lynx \
  net-tools \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*