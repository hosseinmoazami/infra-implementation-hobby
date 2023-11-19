# Arvan

Arvan's interview task

---

[libvirt]
create pool
virsh pool-define-as --name vm --type dir --target /var/lib/kvm/storage/vm
virsh pool-autostart --pool vm
virsh pool-start --pool vm

[libvirt]
install xsltproc
sudo apt install xsltproc

[Ansible]
Install docker on VMs
cd ./makeup/docker
ansible-playbook playbook.yml -u ssh-admin

[Ansible]
Install k8s cluster on VMs
cd ./k8s-cluster
ansible-playbook playbook/site.yml -i inventory.yml

[k8s]
label worker nodes
kubectl label node node02 node-role.kubernetes.io/worker=worker
kubectl label node node03 node-role.kubernetes.io/worker=worker

[K8S, prometheus]
http://192.168.122.200:<RANDOM_PORT>/
kubectl expose service/kube-prometheus-stack-prometheus -n monitoring --type=NodePort --target-port=9090 --name=prometheus-ext

[K8S, grafana]
http://192.168.122.200:<RANDOM_PORT>/
kubectl expose service/kube-prometheus-stack-grafana -n monitoring --type=NodePort --target-port=3000 --name=grafana-ex

[K8S, grafana]
get grafana username, password
kubectl get secret -n monitoring kube-prometheus-stack-grafana -o jsonpath='{.data.admin-user}' | base64 -d
kubectl get secret -n monitoring kube-prometheus-stack-grafana -o jsonpath='{.data.admin-password}' | base64 -d
username: admin
password: prom-operator

[K8S, alertmanager]
http://192.168.122.200:<RANDOM_PORT>/
kubectl expose service/alertmanager-operated -n monitoring --type=NodePort --target-port=9093 --name=alert-manager-ex

[K8S, postgres]
http://192.168.122.200:<RANDOM_PORT>/
kubectl expose service/postgres-ha-postgresql-ha-postgresql -n postgres-ha --type=NodePort --target-port=5432 --name=postgres-ext

[K8S, postgres]
get postgres username and password
kubectl get secret -n postgres-ha postgres-ha-postgresql-ha-postgresql -o jsonpath='{.data.password}' | base64 -d
username: postgres
password: TpiWdACB9U

[App]
create python virtual environments
python3 -m venv .env

[App]
install requirements
pip install -r requirements.txt

[App]
for install psycopg2 python module for connect to postgres is required to install this package on ubuntu
sudo apt install libpq-dev

[App]
start app in env
.env/bin/uvicorn main:app --reload
