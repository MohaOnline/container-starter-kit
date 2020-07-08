# ma3310/centos:6-devel
FROM centos:6
RUN yum install epel-release \
    centos-release-scl \
    https://yum.osc.edu/ondemand/latest/ondemand-release-web-latest-1-6.noarch.rpm -y
RUN yum update -y
RUN yum install rpm-build gcc tar git autoconf automake libtool curl-devel hiredis-devel pcre-devel\
    httpd24-httpd-devel \
    httpd24-apr-devel \
    httpd24-libnghttp2-devel \
    jansson-devel \
    cjose-devel -y
RUN yum clean all 
