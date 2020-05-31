#!/bin/bash

set -e

MYSQL_ROOT_PASSWORD=$(cat /var/run/secrets/mysql_root_password)
EXPORTER_PASSWORD=$(cat /var/run/secrets/exporter_password)

mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOSQL
CREATE USER 'exporter'@'%' IDENTIFIED BY '$EXPORTER_PASSWORD';
GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'%';
GRANT SELECT ON performance_schema.* TO 'exporter'@'%';
EOSQL



