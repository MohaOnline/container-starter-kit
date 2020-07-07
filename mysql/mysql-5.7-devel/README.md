``` bash
# 用容器 mysql:5.7 连接 compose 启动的 MySQL 5.7 
docker run -it --rm --network mysql-57_default mysql:5.7 mysql -hmysql-57_mysql-root_1 -uroot -p
```