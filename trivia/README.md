``` bash
# 列出所有容器
docker container ls -a

# 启动容器
docker container run -d --name trivia fundamentalsofdocker/trivia:ed2

# 删除容器
docker container rm -fv trivia
```
