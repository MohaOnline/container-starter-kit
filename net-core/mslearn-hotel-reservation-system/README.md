Prepared docker for mslearn-hotel-reservation-system.

## 使用方法

``` bash
# 编译镜像
docker build -t mslearn-hotel-reservation-system .

# 运行容器
docker run -d -p 8080:80/tcp --name reservations mslearn-hotel-reservation-system

# 应用可访问地址
http://localhost:8080/api/reservations/1
```