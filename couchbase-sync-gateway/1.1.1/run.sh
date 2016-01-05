#!/bin/bash

function finish {
  kill -9 `pidof gearmand`
}

trap finish SIGTERM SIGKILL

if [ ! -z $COUCHBASE_HOST ]; then
  for i in {60..0}; do
    wget -S --spider $COUCHBASE_HOST:${COUCHBASE_PORT:-8091} 2>&1 | awk '/^  /'
    if [ $? -ne 0 ] then
      break
    fi

		echo 'Couchbase init process in progress...'
		sleep 2
	done

	if [ "$i" = 0 ]; then
		echo >&2 'Couchbase init process failed.'
		exit 1
	fi
fi

exec sync_gateway /config.json
