

``` bash
# 确认 Jenkins 版本
docker run -it --rm jenkins/jenkins:lts-jdk11 --version
```

``` bash
docker run --rm -d \
  --name jenkins \
  -p 8080:8080 \
  -u root \
  -v $HOME:/root \
  -v data/:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

```


