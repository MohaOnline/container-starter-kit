``` bash 
# remove last built image
docker image rm node-app-hello

docker build -t node-app-hello .

docker rm -f node-app-hello-container

docker run --rm -it -p 3000:3000 --name node-app-hello-container node-app-hello
```