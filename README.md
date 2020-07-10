Under install folder run:

``` bash
docker-compose -f "_default/docker-compose.yml" up -d 
```

Or under _default folder run:

``` bash
docker-compose up -d 
```

will start the dockers left in _default/docker-compose.yml.

``` bash
# 
docker run --rm -it --network=cst_default -v ~/:/root ma3310/ubuntu:20.04-tools

# Connect to default
mysql -hcst_mysql-5.7_1 -p
```