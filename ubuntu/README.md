# Ubuntu

## Customized Ubuntu
### ma3310/ubuntu:20.04-tools

Image ma3310/ubuntu:20.04-tools contains necessary diagnostic tools to save time for people who work from official Ubuntu image.
These tools are from official repository.

| Package   | Command  | Function                  |
|-----------|----------|---------------------------|
| curl      | curl     |                           |
| mycli     | mycli    | MySQL/MariaDB client tool |
| net-tools | ifconfig |                           |
|           | netstat  |                           |
|           | route    |                           |

``` bash
# 发布镜像前需登录镜像仓库
docker login

# 构建/发布/部署客制化 ubuntu 20.04 镜像
docker build . -t ma3310/ubuntu:20.04-tools
docker push ma3310/ubuntu:20.04-tools
docker pull ma3310/ubuntu:20.04-tools


# 启动客制化 ubuntu 镜像
docker run --rm -it --network=csk_default -v ~/:/root ma3310/ubuntu:20.04-tools /bin/zsh
docker run --rm -it -v ~/:/root ma3310/ubuntu:20.04-tools /bin/zsh
docker run --rm -it --network=host -v ~/:/root ma3310/ubuntu:20.04-tools /bin/zsh
```

## Official 20.04
``` bash
# 根据官方镜像 ubuntu:20.04 启动容器
docker run --rm -it ubuntu:20.04
```
