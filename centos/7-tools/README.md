``` bash
# 给 CentOS 7 添加必要工具用户调试
# wget
docker image build -t ma3310/centos:7-tools .

### 使用方法
# 启动自定义镜像，结束后自动删除
docker run --rm -it ma3310/centos:7-tools
```