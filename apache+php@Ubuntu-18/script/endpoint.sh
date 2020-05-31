#!/bin/sh

service php7.2-fpm restart
exec "$@"