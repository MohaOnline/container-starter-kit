# Docker Hub: ma3310/drupal:7-php-7.4-nginx-ubuntu
FROM ubuntu:20.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN echo "exit 0" > /usr/sbin/policy-rc.d

# Installed nginx and php from ondrej; lynx
RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common \
  && add-apt-repository ppa:ondrej/nginx && add-apt-repository ppa:ondrej/php && apt-get update \
  && apt-get install -y lynx \
  && apt-get install -y nginx-extras \
    php7.4 php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-json php7.4-xmlrpc php7.4-zip php7.4-bcmath php7.4-gd php7.4-fpm php7.4-curl php7.4-cli php7.4-xml \
    php-tokenizer php-redis \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80 443

CMD service php7.4-fpm start && nginx -g "daemon off;"
