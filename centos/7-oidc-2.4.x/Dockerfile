# Docker Hub: ma3310/centos:7-oidc-2.4.x
# Apache Configure Location: /etc/httpd
# Document Root: /var/www/html
FROM centos:7
RUN yum install epel-release \
    centos-release-scl -y
RUN yum update -y
RUN yum install certbot httpd \
    mod_ssl \
    mod_session \
    https://mod-auth-openidc.org/download/cjose-0.6.1.5-1.el7.x86_64.rpm \
    https://mod-auth-openidc.org/download/mod_auth_openidc-2.4.3-1.el7.x86_64.rpm \
    -y 

RUN yum clean all

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

EXPOSE 80 443

COPY httpd-foreground /usr/local/bin/

CMD ["httpd-foreground"]
