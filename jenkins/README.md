

``` bash
# 确认 Jenkins 版本
docker run -it --rm jenkins/jenkins:lts-jdk11 --version

# 备份 volume
docker run --rm -v compose_jenkins_home_lts_jdk11_proxy:/volume busybox sh -c 'tar -cOzf - /volume' > volume-export.tgz
docker run -it --rm -v compose_jenkins_home_lts_jdk11_proxy:/data -v ~/:/root ma3310/ubuntu:20.04-tools /bin/zsh
tar czp -C /data/ --numeric-owner -f ~/backup/jenkins-home.tar.gz ./

# 需要在 Linux 文件系统上恢复，macOS 总是会重写 owner
tar xzp --numeric-owner -C /data/ -f ~/backup/jenkins-home.tar.gz
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


