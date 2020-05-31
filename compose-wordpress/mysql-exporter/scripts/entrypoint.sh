#!/bin/bash

set -e

PASSWORD=$(cat /run/secrets/exporter_password)

sed -i "s/REPLACE_WITH_SECRET/$PASSWORD/g" ~/.my.cnf

exec "$@"