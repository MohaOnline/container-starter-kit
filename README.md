# Container Starter Kit

Container Starter Kit provides bounch of out-of-box service receipts basing on Container technoligies basing on different senarios.

## Localhost

Localhost services definations are put under _compose folder, they base on docker-compose tools, and could be used in localhost environment.

Under root folder run:

``` bash
docker-compose -f "_compose/docker-compose.yml" up -d 
```

Or under _compose folder run:

``` bash
docker-compose up -d 
```

will start the services in _compose/docker-compose.yml, MySQL are included. To check check started services, user could leverage below commands:

``` bash
# Run tools container within same network of services.
docker run --rm -it --network=cst_default -v ~/:/root ma3310/ubuntu:20.04-tools

# Connect to MySQL
mysql -hcst_mysql-5.7_1 -p
```
