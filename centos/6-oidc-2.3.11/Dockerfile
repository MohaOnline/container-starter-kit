# Docker Hub: ma3310/centos:6-oidc-2.3.11
# Apache Configure Location: /opt/rh/httpd24/root/etc/httpd
# Document Root: /opt/rh/httpd24/root/var/www/html
FROM centos:6
RUN yum install epel-release \
    centos-release-scl \
    https://yum.osc.edu/ondemand/latest/ondemand-release-web-latest-1-6.noarch.rpm -y
RUN yum update -y
RUN yum install httpd24-httpd \
    httpd24-mod_ssl \
    httpd24-mod_session \
    httpd24-mod_auth_openidc -y
RUN yum clean all

# Add certbot support
# ADD https://dl.eff.org/certbot-auto /usr/local/bin/
# RUN chmod 0755 /usr/local/bin/certbot-auto && /usr/local/bin/certbot-auto -n

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY httpd-foreground /usr/local/bin/

EXPOSE 80 443

CMD ["httpd-foreground"]
