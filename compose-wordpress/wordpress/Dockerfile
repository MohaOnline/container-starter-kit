FROM wordpress:latest

RUN sed -s -i -e "s/80/8080/g" /etc/apache2/sites-available/*.conf \
  /etc/apache2/ports.conf 

USER 33
