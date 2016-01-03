#!/bin/bash

function finish {
  kill -9 `pidof gearmand`
}

trap finish SIGTERM SIGKILL

PARAMS="--backlog=32 \
  --job-retries=0 \
  --listen=0.0.0.0 \
  --threads=4 \
  --worker-wakeup=0 \
  --log-file=none \
  --file-descriptors=65536 \
  --port=${GEARMAN_PORT:-4730} \
  "

if [ ! -z $MYSQL_HOST ]; then
  PARAMS="$PARAMS --queue-type=mysql \
  --mysql-host=$MYSQL_HOST \
  --mysql-port=${MYSQL_PORT:-3306} \
  --mysql-user=${MYSQL_USER:-root} \
  --mysql-password=$MYSQL_PASSWORD \
  --mysql-db=${MYSQL_DB:-gearman} \
  --mysql-table=${MYSQL_TABLE:-gearman_queue}"

  for i in {30..0}; do
		if mysqladmin ping --host=$MYSQL_HOST --port=${MYSQL_PORT:-3306} --user=${MYSQL_USER:-root} --password=$MYSQL_PASSWORD &>/dev/null; then
			break
		fi
		echo 'MySQL init process in progress...'
		sleep 2
	done
	if [ "$i" = 0 ]; then
		echo >&2 'MySQL init process failed.'
		exit 1
	fi
fi

echo "Starting gearman job server with params: $PARAMS"

exec gearmand $PARAMS
