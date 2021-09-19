Prepared docker for mslearn-hotel-reservation-system.

## 使用方法

``` bash
# 编译镜像
cd repo/dotnet
docker build -t mslearn-deploy-run-container-app-service .

# 运行容器
docker run -d -p 8080:80/tcp --name container-app mslearn-deploy-run-container-app-service

# 应用可访问地址
http://localhost:8080/
```