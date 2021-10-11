#!/bin/sh

# 启动容器时绑入代码目录
# 用 ./node_modules/.bin/nodemon index.js 启动实现代码变更自动加载
docker container run --rm -it \
    --volume $(pwd):/content/node-app-hello \
    --volume ~/:/root \
    -p 3000:3000 \
    node-app-hello \
    /bin/bash -c './node_modules/.bin/nodemon'
