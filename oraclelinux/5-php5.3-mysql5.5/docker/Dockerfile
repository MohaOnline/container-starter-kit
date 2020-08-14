# Docker Hub: ma3310/oraclelinux:5-php5.3-mysql5.5
FROM oraclelinux:5

RUN rpm -i http://archives.fedoraproject.org/pub/archive/epel/5/x86_64/epel-release-5-4.noarch.rpm --nosignature 
RUN rpm -i http://rpms.remirepo.net/enterprise/remi-release-5.rpm --nosignature 
RUN rpm -i http://www.tuxad.com/repo/5/tuxad.rpm --nosignature  

RUN yum install yum-utils -y
RUN yum update -y

RUN yum install --enablerepo=tuxad-php \
    httpd \
    mod_ssl \
    make \
    php \
    php-cli \
    php-gd \
    php-mbstring \
    php-pdo \
    php-mysql \
    php-pgsql \
    php-bcmath \
    php-devel \
    php-xml \
    php-soap \
    php-pear \
    mysql55-mysql-server \
    -y


