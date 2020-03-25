# remove last built image
docker image rm node-app-hello

docker build -t node-app-hello .

docker stop node-app-hello-container

docker run --rm -p 3000:3000 --name node-app-hello-container node-app-hello
