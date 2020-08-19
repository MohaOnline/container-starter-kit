# PHP Images

Normally when we start PHP image, we intend to provides PHP environment for an application, which usually involve several PHP extensions as well, Official PHP image provides special commands to accomplish it, which is different with traditional way. This repository uses old school approach to integrates PHP environment to meet different requirements.

Access related Docker images at https://hub.docker.com/r/ma3310/php.

## ma3310/php:7.4-nginx-ubuntu-20.04

This images provides PHP 7.4 environment, as well as most used PHP tools, like composer, drush, etc. It bases on Ubuntu 20.04, integrates Ubuntu style nginx and PHP repository (https://launchpad.net/~ondrej) to setup nginx and PHP environment. 

With default configuration, this image only listen 80 port for http service. PHP project folder could be mount to /var/www/html to check result.

User could prepare sites configuration, then mount resident folder to /etc/nginx/sites-enabled.

## Official PHP 7.4-cli

### Usage
``` bash
# 调用 php 7.4 环境命令行
docker run --rm -it php:7.4 bash
```
