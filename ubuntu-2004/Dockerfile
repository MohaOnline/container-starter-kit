FROM ubuntu:20.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt install -y \
  curl \
  iputils-ping \
  lynx \
  net-tools \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/*