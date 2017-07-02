#!/bin/bash
set -e

if [ "$1" = '/bin/bash' ]; then
    exec "$@"
fi

exec rabbitmq-cli-consumer -c ${CONFIG_PATH:-/etc/rabbitmq-cli-consumer/config.conf} -V -e "$@"
