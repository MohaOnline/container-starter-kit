``` bash
# 构建客制化 ubuntu 镜像
docker build . -t ma3310/ubuntu:20.04
docker push ma3310/ubuntu:20.04

# 绑定 20.04 为 latest
docker tag ma3310/ubuntu:20.04 ma3310/ubuntu
docker push ma3310/ubuntu

# 启动客制化 ubuntu 镜像
docker run --rm -it --name ubuntu-2004 ma3310/ubuntu:20.04

# 根据官方镜像 ubuntu:20.04 启动容器
docker run --rm -it --name ubuntu-2004 ubuntu:20.04

```
