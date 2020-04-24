``` bash 
# Rebuilt image
docker image rm node-app-hello
docker build -t node-app-hello .

docker rm -f node-app-hello-container

docker run --rm -it \
  --name node-app-hello-container \
  -p 3000:3000 \
  -v $HOME:/root
  node-app-hello
```

安装开发依赖

``` bash
npm install nodemon --save-dev            # 代码热加载
npm install jasmine request --save-dev    # 自动化测试
npm install testcontainers --save-dev     # 
```