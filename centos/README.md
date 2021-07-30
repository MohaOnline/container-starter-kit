


``` bash
### CentOS 6 已无法启动
# 启动官方镜像 6，结束后自动删除
docker run --rm -it centos:6

# 启动官方镜像 7，结束后自动删除
docker run --rm -it centos:7

# 启动官方镜像 8，结束后自动删除
docker run --rm -it centos:8

# 启动官方镜像 8,
docker run -it --name centos-8 centos:8
```