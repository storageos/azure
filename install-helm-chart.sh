helm install ./storageos --name storageos \
    --set image.repository=soegarots/node \
    --set image.tag=8c97066-a8cb5e62 \
    --set service.type=LoadBalancer \
    --set cluster.join="$(storageos cluster create)" \
    --set rbacEnabled=true \
    --set cluster.sharedDir=/var/lib/kubelet/plugins/kubernetes.io~storageos
