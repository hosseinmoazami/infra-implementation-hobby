# Arvan

Arvan's interview challenge

---

## Prerequisite packages

The following packages are required to launch the project:

- terraform
- ansible
- docker
- docker compose
- python3.10.12
- pip
- qemu-kvm
- libvirt
- libvirt-daemon-system
- libvirt-daemon
- virtinst
- xsltproc
- libpq-dev

> xsltproc is a command line tool for applying XSLT stylesheets to XML documents.

> libpq-dev is required for psycopg2 python module to connect to postgres.

## Create VMs

This provider and the following module are required to implement the virtualization infrastructure on the kvm platform.

- dmacvicar/libvirt
- MonolithProjects/vm/libvirt

To run terraform do:

```
cd vm
terraform init
terraform plan
terraform apply --auto-approve
```

## Install docker on VMs

```
cd makeup/ansible/docker
ansible-playbook playbook/docker.yml -i inventory.yml
```

## Install gitlab-ce on host machine

> It's not recommend to install on host. solution is to have a machine for it.

```
cd makeup/docker/gitlab
docker compose up -d
```

### Retrieve gitlab root password

```
docker exec -it gitlab-server grep 'Password:' /etc/gitlab/initial_root_password
```

## Prepare builder machine

Install gitlab-runner and deploy a private registry

> before installation must generate a gitlab runner from gitlab and get a token.

> change variable in defaults/main.yml, also need to download gitlab-runner.deb an put in files directory or uncomment curl command in task name Install gitlab runner in tasks/main.yml in this case comment copy task.

```
cd makeup/ansible
ansible-playbook playbook/builder.yml -i inventory.yml
```

> This private registry is insecure and should be trusted by the Docker daemon as described below

add this section to /etc/docker/daemon.json

```
{
        "insecure-registries" : [ "registry.local:5000" ]
}
```

## Install k8s cluster on VMs

```
cd k8s-cluster
ansible-playbook playbook/site.yml -i inventory.yml
```

> Be careful to make a backup of ~/.kube/config before running. Because it will be replaced by the new cluster configuration file. If not, you can download the configuration file from the /etc/rancher/k3s/k3s.yaml path.

> If the worker's do not labeled as worker

```
kubectl label node node02 node-role.kubernetes.io/worker=worker
kubectl label node node03 node-role.kubernetes.io/worker=worker
```

## Create namespaces by terraform

### providers

- hashicorp/kubernetes

```
cd makeup/k8s
terraform init
terraform plan
terraform apply --auto-approve
```

## Implement monitoring stack

consist of prometheus, grafana and alert manager

### providers

- hashicorp/kubernetes
- hashicorp/helm

### helm

- repo: https://prometheus-community.github.io/helm-charts
- chart: kube-prometheus-stack

```
cd monitoring
terraform init
terraform plan
terraform apply --auto-approve
```

> Manually create a service for expose node, to have access our monitoring on localhost

```
kubectl expose service/monitoring-stack-kube-prom-prometheus -n monitoring --type=NodePort --target-port=9090 --name=prometheus-ext
kubectl expose service/monitoring-stack-grafana -n monitoring --type=NodePort --target-port=3000 --name=grafana-ex
kubectl expose service/monitoring-stack-kube-prom-alertmanager -n monitoring --type=NodePort --target-port=9093 --name=alert-manager-ex
```

All services are accessible from control plane IP address and a random port
http://192.168.122.200:<RANDOM_PORT>/

### Retrieve grafana username, password

```
kubectl get secret -n monitoring kube-prometheus-stack-grafana -o jsonpath='{.data.admin-user}' | base64 -d
kubectl get secret -n monitoring kube-prometheus-stack-grafana -o jsonpath='{.data.admin-password}' | base64 -d
```

- username: admin
- password: prom-operator

## Implement postgres cluster by terraform:

### providers

- hashicorp/kubernetes
- hashicorp/helm

### helm

- repo: https://charts.bitnami.com/bitnami
- chart: postgresql-ha

```
cd postgres-cluster
terraform init
terraform plan
terraform apply --auto-approve
```

> Manually create a service for expose node, to have access on localhost

```
kubectl expose service/postgres-ha-postgresql-ha-postgresql -n postgres-ha --type=NodePort --target-port=5432 --name=postgres-ext
```

### Retrieve postgres username, password

```

kubectl get secret -n postgres-ha postgres-ha-postgresql-ha-postgresql -o jsonpath='{.data.password}' | base64 -d

```

- username: postgres
- password:

## Web api application

Create python virtual environments and install requirements

```
cd application
python3 -m venv venv
pip install -r requirements.txt
```

### Start app in env mode

```
source .env/bin/activate
.env/bin/uvicorn main:app --reload
```

## What to do, what not to do

- [x] install prerequisite
- [x] create VMs by terraform
- [x] install docker on VMs
- [x] create namespaces on k8s cluster
- [x] implement monitoring stack
- [ ] automate service expose
- [ ] nodePort with specific port
- [ ] alert manager config
- [x] implement postgres cluster
- [x] app development
- [x] app metrics
- [ ] app monitoring dashboard
- [x] install gitlab ce
- [x] install gitlab runner
- [x] create a private registry
- [x] fix insecure registry in VMs
- [ ] create ci/cd pipeline on gitlab
- [ ] build app on builder machine
- [ ] push app image to private registry
- [ ] deploy app on k8s
