FROM quay.io/prometheus/busybox:latest

ARG VERSION=0.12.1
ARG FILENAME=mysqld_exporter-${VERSION}.linux-amd64
ARG URL=https://github.com/prometheus/mysqld_exporter/releases/download/v

RUN wget $URL$VERSION/$FILENAME.tar.gz && \
  tar -xvf $FILENAME.tar.gz && \
  mv $FILENAME/mysqld_exporter /bin/mysqld_exporter

COPY conf/my.cnf /home/.my.cnf

COPY ./scripts/entrypoint.sh ~/entrypoint.sh

USER nobody

EXPOSE 9104

ENTRYPOINT  [ "sh", "~/entrypoint.sh" ]

CMD  [ "/bin/mysqld_exporter" ]
