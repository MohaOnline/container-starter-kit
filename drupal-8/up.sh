# 启动 docker-compose.yml
export PREFIX_NAME=drupal-8     # https://forums.docker.com/t/docker-compose-not-seeing-environment-variables-on-the-host/11837/2
docker-compose up -d            

docker inspect ${PREFIX_NAME}_phpmyadmin


