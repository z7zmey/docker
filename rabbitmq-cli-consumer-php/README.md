# rabbitmq cli consumer for php
## Quick start by docker

```bash
docker run \
    -v `pwd`/config.conf:/etc/rabbitmq-cli-consumer/config.conf \
    -v `pwd`/src:/src \
    z7zmey/rabbitmq-cli-consumer-php php\ /src/path/to/consumer.php
```

## Docker compose example

```YAML
rabbitmq-cli-consumer:
    image: z7zmey/rabbitmq-cli-consumer-php
    command: php\ /src/path/to/consumer.php
    volumes:
        - ./config.conf:/etc/rabbitmq-cli-consumer/config.conf
        - ./src:/src
```

config.conf

```ini
[rabbitmq]
host = rabbit
username = user
password = pass
vhost=/
port=5672
queue=test_queue
compression=Off

[logs]
error = /var/log/error.log
info = /var/log/info.log
```