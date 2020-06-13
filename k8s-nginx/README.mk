``` bash
# 建删查 pod / service
kubectl create -f nginx-pod.yml
kubectl get pods
kubectl delete pod/nginx-alpine
kubectl describe pod nginx-alpine

kubectl create -f nginx-service.yml
kubectl get services
kubectl delete service/nginx-alpine
kubectl describe service nginx-alpine

# 可访问 nginx 默认页面
lynx localhost

# 新建 Pod 巡查 kubernetes service
# 用官方 Ubuntu 镜像，进入命令行后需手动添加网络诊断工具
kubectl run -i --tty --image=ubuntu:20.04 --restart=Never --rm=true k8s-ubuntu

# 用第三方 Ubuntu 镜像自带网络诊断工具
kubectl run -i --tty --image=ma3310/ubuntu:20.04 --restart=Never --rm=true k8s-ubuntu
# 进入 Pod 后可通过 service 名确认服务是否工作
curl nginx-alpine
wget -qO - nginx-alpine

# 通过 docker 工具巡查 pod
docker container ls
docker run --rm -it --net container:CONTAINER_ID ma3310/ubuntu:20.04
```