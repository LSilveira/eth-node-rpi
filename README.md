# eth-node-rpi

**Generate template:**
>helm template eth-node-rpi -f values/tita.yaml . --output-dir manifest

**Create helm package**
>helm package .

**Install helm package**
>helm install eth-node eth-node-rpi-0.1.0.tgz

**Install helm pacage with microk8s**
>microk8s helm3 install eth-node -f values/tita.yaml eth-node-rpi-0.1.0.tgz

**Portforwarding**
>export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=eth-node-rpi,app.kubernetes.io/instance=eth-node" -o jsonpath="{.items[0].metadata.name}")
>export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
>kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT


**Get contexts**
>kubectl config get-contexts

**Enable microk8s services**
>microk8s enable dns storage helm3

**Get all nodes**
>kubectl get all -l app.kubernetes.io/instance=eth-node


**Get wide**
>kubectl get pod eth-node-rpi-tita-0 -o wide

**Pod description**
>kubectl describe pod eth-node-rpi-tita-0
