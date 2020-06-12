```bash
kubectl create -f nginx-pod.yml
kubectl get pods
kubectl delete pod/nginx-alpine
kubectl describe pod nginx-alpine

kubectl create -f nginx-service.yml
kubectl get services
kubectl delete service/nginx-alpine
kubectl describe service nginx-alpine

kubectl run -i --tty --image=ubuntu --restart=Never --rm=true ubuntu

```