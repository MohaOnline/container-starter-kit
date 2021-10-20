``` bash
# 生成可用 Key
docker run --rm -it --entrypoint /keygen.sh linuxserver/openssh-server

# 启动时需指定 ssh 用户名
docker run -d \
  --name=openssh-server \
  --hostname=openssh-server  \
  -e TZ=Asia/Shanghai \
  -e USER_NAME=username \
  -e PUBLIC_KEY="public_key" \
  -p 2222:2222 \
  --restart unless-stopped \
  lscr.io/linuxserver/openssh-server
```