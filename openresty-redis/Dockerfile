ARG RESTY_IMAGE_BASE="centos"
ARG RESTY_IMAGE_TAG="7"

FROM ${RESTY_IMAGE_BASE}:${RESTY_IMAGE_TAG}

ARG RESTY_IMAGE_BASE="centos"
ARG RESTY_IMAGE_TAG="7"
ARG RESTY_LUAROCKS_VERSION="3.1.3"
ARG RESTY_RPM_FLAVOR=""
ARG RESTY_RPM_VERSION="1.15.8.1-1.el7"
ARG RESTY_RPM_ARCH="x86_64"

LABEL resty_image_base="${RESTY_IMAGE_BASE}"
LABEL resty_image_tag="${RESTY_IMAGE_TAG}"
LABEL resty_luarocks_version="${RESTY_LUAROCKS_VERSION}"
LABEL resty_rpm_flavor="${RESTY_RPM_FLAVOR}"
LABEL resty_rpm_version="${RESTY_RPM_VERSION}"
LABEL resty_rpm_arch="${RESTY_RPM_ARCH}"

RUN yum-config-manager --add-repo https://openresty.org/package/${RESTY_IMAGE_BASE}/openresty.repo \
  && yum install -y \
  gettext \
  make \
  openresty${RESTY_RPM_FLAVOR}-${RESTY_RPM_VERSION}.${RESTY_RPM_ARCH} \
  openresty-opm-${RESTY_RPM_VERSION} \
  openresty-resty-${RESTY_RPM_VERSION} \
  unzip \
  && cd /tmp \
  && curl -fSL https://luarocks.github.io/luarocks/releases/luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  -o luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  && tar xzf luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  && cd luarocks-${RESTY_LUAROCKS_VERSION} \
  && ./configure \
  --prefix=/usr/local/openresty/luajit \
  --with-lua=/usr/local/openresty/luajit \
  --lua-suffix=jit-2.1.0-beta3 \
  --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
  && make build \
  && make install \
  && cd /tmp \
  && rm -rf luarocks-${RESTY_LUAROCKS_VERSION} luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
  && yum remove -y make \
  && yum clean all \
  && ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log \
  && ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log


RUN /usr/local/openresty/openssl/bin/openssl req -newkey rsa:4096 -nodes -x509 -days 365 \
  -subj "/C=BE/ST=Brussels/L=Brussels/O=IT/CN=www.example.com" \
  -keyout /etc/pki/tls/private/server.key \
  -out /etc/pki/tls/certs/server.crt \
  -config /etc/pki/tls/openssl.cnf

ARG RESTY_J="1"

ENV PATH=$PATH:/usr/local/openresty/luajit/bin:/usr/local/openresty/nginx/sbin:/usr/local/openresty/bin

ENV LUA_PATH="\
  /usr/local/openresty/site/lualib/?.ljbc;/usr/local/openresty/site/lualib/?/init.ljbc;\
  /usr/local/openresty/lualib/?.ljbc;/usr/local/openresty/lualib/?/init.ljbc;\
  /usr/local/openresty/site/lualib/?.lua;/usr/local/openresty/site/lualib/?/init.lua;\
  /usr/local/openresty/lualib/?.lua;/usr/local/openresty/lualib/?/init.lua;\
  ./?.lua;/usr/local/openresty/luajit/share/luajit-2.1.0-beta3/?.lua;/usr/local/share/lua/5.1/?.lua;\
  /usr/local/share/lua/5.1/?/init.lua;/usr/local/openresty/luajit/share/lua/5.1/?.lua;\
  /usr/local/openresty/luajit/share/lua/5.1/?/init.lua"

ENV LUA_CPATH="\
  /usr/local/openresty/site/lualib/?.so;/usr/local/openresty/lualib/?.so;\
  ./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/openresty/luajit/lib/lua/5.1/?.so;\
  /usr/local/lib/lua/5.1/loadall.so;/usr/local/openresty/luajit/lib/lua/5.1/?.so"

COPY ./conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ./conf/nginx.vh.default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/error-page.html /usr/share/nginx/html/error-page.html

EXPOSE 443

CMD ["/usr/bin/openresty", "-g", "daemon off;"]

STOPSIGNAL SIGQUIT