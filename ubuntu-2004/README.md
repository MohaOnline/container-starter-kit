``` bash
# 构建自用 ubuntu 镜像
docker build . -t ma3310/ubuntu

# 根据镜像 ubuntu:20.04 启动容器
docker run -rm -it --name ubuntu-2004 ubuntu:20.04

```
