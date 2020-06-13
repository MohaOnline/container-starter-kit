``` bash
# 根据镜像 nginx:alpine 启动容器
docker run -d --name nginx -p 8080:80 nginx:alpine

docker stop nginx

```