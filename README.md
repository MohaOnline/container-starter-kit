# Container Starter Kit

Container Starter Kit provides bunch of out-of-box service receipts basing on Container technoligies basing on different senarios.

## Localhost

Localhost services definations are under _compose folder, these services base on docker-compose tool, and could be used in single machine environment.

Under Root/Cloned folder run:

``` bash
docker-compose -f "_compose/docker-compose.yml" up -d 
```

Or under _compose folder run:

``` bash
docker-compose up -d 
```

It will start the services in _compose/docker-compose.yml, MySQL are included. To check started services, user could leverage below commands:

``` bash
# Run tools container within same network of services.
docker run --rm -it --network=cst_default -v ~/:/root ma3310/ubuntu:20.04-tools

# Connect to MySQL
mysql -hcst_mysql-5.7_1 -p
```
