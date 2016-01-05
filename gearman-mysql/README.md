# Gearman
## Quick start

```
$ docker run z7zmey/gearman-mysql
```

## environment variables
- **GEARMAN_PORT** default 4730
- **MYSQL_HOST** gearman will use the mysql database and wait that init
- **MYSQL_PORT** default 3306
- **MYSQL_USER** default root
- **MYSQL_PASSWORD**
- **MYSQL_DB** default gearman
- **MYSQL_TABLE** default gearman_queue

## Start with mysql

```
$ docker run -d --name=db \
  -e MYSQL_ROOT_PASSWORD=pass \
  -e MYSQL_DATABASE=gearman \
  -e MYSQL_USER=gearman \
  -e MYSQL_PASSWORD=gearman \
  mysql:5.6

$ docker run --link=db \
  -e MYSQL_HOST=db \
  -e MYSQL_USER=gearman \
  -e MYSQL_PASSWORD=gearman \
  z7zmey/gearman-mysql
```

## Docker compose example

```YAML
gearman:
  container_name: gearman
  image: z7zmey/gearman-mysql
  links:
    - gearman_db
  environment:
    MYSQL_HOST: gearman_db
    MYSQL_USER: gearman
    MYSQL_PASSWORD: gearman
  ports:
    - "4730:4730"

gearman_db:
  container_name: gearman_db
  image: mysql:5.6
  environment:
    MYSQL_USER: gearman
    MYSQL_ROOT_PASSWORD: gearman
    MYSQL_PASSWORD: gearman
    MYSQL_DATABASE: gearman
```
