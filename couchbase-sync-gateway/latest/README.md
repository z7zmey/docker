# Couchbase sync gateway
## Quick start by docker

```
$ docker run -p 4984:4984 -p 4985:4985 -v /path/to/config.json:/config.json z7zmey/couchbase-sync-gateway
```

## environment variables
**COUCHBASE_HOST** - if defined sync gateway will start after couchbase warmup

**COUCHBASE_PORT** - TODO

## Docker compose example

```YAML
couchbase:
  container_name: couchbase
  image: couchbase/server:community-4.0.0
  volumes:
    - /path/to/couchbase/var/:/opt/couchbase/var
  ports:
    - "8091:8091"

sync-gateway:
  container_name: sync_gateway
  image: z7zmey/couchbase-sync-gateway
  volumes:
    - ./sync-gateway.json:/config.json
  links:
      - couchbase
  environment:
    COUCHBASE_HOST: couchbase
  ports:
    - "4984:4984"
    - "4985:4985"
```
