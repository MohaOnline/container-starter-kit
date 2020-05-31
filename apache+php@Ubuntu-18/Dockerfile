FROM ubuntu:18.04

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_SERVER_NAME server
ENV APACHE_SERVER_ADMIN admin@server
ENV APACHE_SSL_CERTS server.crt 
ENV APACHE_SSL_PRIVATE server.key
ENV APACHE_SSL_PORT 10443
ENV APACHE_LOG_LEVEL info
ENV APACHE_SSL_LOG_LEVEL info
ENV APACHE_SSL_VERIFY_CLIENT optional
ENV APACHE_HTTP_PROTOCOLS http/1.1
ENV APPLICATION_URL https://${APACHE_SERVER_NAME}:${APACHE_SSL_PORT}
ENV CLIENT_VERIFY_LANDING_PAGE /error.php
ENV API_BASE_PATH /secure/api
ENV HTTPBIN_BASE_URL http://127.0.0.1:8000${API_BASE_PATH}

RUN apt update && apt install -y \
  apache2 \
  php php7.2-fpm \
  curl \
  python3-pip \
  git \
  && rm -rf /var/lib/apt/lists/*

COPY src/config/00-default.conf /etc/apache2/sites-available/
COPY src/config/default-ssl.conf /etc/apache2/sites-available/
COPY src/config/ssl-params.conf /etc/apache2/conf-available/
COPY src/config/dir.conf /etc/apache2/mods-enabled/
COPY src/config/ports.conf /etc/apache2/
COPY src/certs/server.crt /etc/ssl/certs/
COPY src/certs/server.key /etc/ssl/private/
COPY src/www/*.html /var/www/html/
COPY src/scripts/entrypoint /entrypoint

RUN chmod +x /entrypoint \
  && mkdir /run/php \
  && cd /var/www \
  && chown -R www-data:www-data /var/www/html

RUN a2enmod ssl \
  && a2enmod headers \
  && a2enmod rewrite \
  && a2dismod mpm_prefork \
  && a2dismod mpm_event \
  && a2enmod mpm_worker \
  && a2enmod proxy_fcgi \
  && a2enmod http2 \
  && a2enmod proxy \
  && a2enmod proxy_http \
  && a2enmod remoteip \
  && a2ensite default-ssl \
  && a2enconf ssl-params \
  && a2enconf php7.2-fpm \
  && c_rehash /etc/ssl/certs/

EXPOSE ${APACHE_SSL_PORT}

ENTRYPOINT ["/entrypoint"]

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
