# 客制化镜像
``` bash
# 发布镜像前需登录镜像仓库
docker login

# 构建/发布客制化 ubuntu 20.04 镜像
docker build . -t ma3310/ubuntu:20.04-tools
docker push ma3310/ubuntu:20.04-tools

# 启动客制化 ubuntu 镜像
docker run --rm -it ma3310/ubuntu:20.04-tools
```

# 官方镜像
``` bash
# 根据官方镜像 ubuntu:20.04 启动容器
docker run --rm -it ubuntu:20.04
```
