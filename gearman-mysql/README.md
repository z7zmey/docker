# Quick start

```
$ docker run -d --name=db \
  -e MYSQL_ROOT_PASSWORD=pass \
  -e MYSQL_DATABASE=gearman \
  -e MYSQL_USER=gearman \
  -e MYSQL_PASSWORD=gearman \
  mysql:5.6

$ docker run --link=db \
  -e MYSQL_HOST=db \
  -e MYSQL_DB=gearman \
  -e MYSQL_USER=gearman \
  -e MYSQL_PASSWORD=gearman \
  z7zmey/gearman-mysql
```

or docker-compose.yaml

```YAML
gearman:
  container_name: kismia_gearman
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
  container_name: kismia_gearman_db
  image: mysql:5.6
  environment:
    MYSQL_USER: gearman
    MYSQL_ROOT_PASSWORD: gearman
    MYSQL_PASSWORD: gearman
    MYSQL_DATABASE: gearman
```
