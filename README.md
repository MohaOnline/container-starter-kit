Under root folder run:

``` bash
docker-compose -f "_default/docker-compose.yml" up -d 
```

Or under _default folder run:

``` bash
docker-compose up -d 
```

will start the services in _default/docker-compose.yml. User could also execute below commands to check started services.

``` bash
# Run tools container within same network of services.
docker run --rm -it --network=cst_default -v ~/:/root ma3310/ubuntu:20.04-tools

# Connect to MySQL
mysql -hcst_mysql-5.7_1 -p
```