# Arvan

Arvan's interview challenge

---

[prerequisite]

## Prerequisite packages

The following packages are required to launch the project:

- terraform
- ansible
- python3.10.12
- pip
- qumu-kvm
- libvirt
- libvirt-daemon-system
- libvirt-daemon
- virtinst
- xsltproc
- libpq-dev

> xsltproc is a command line tool for applying XSLT stylesheets to XML documents.
> libpq-dev is required for psycopg2 python module to connect to postgres

[libvirt]

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

[Ansible]

## Install docker on VMs

```
cd makeup/ansible/docker
ansible-playbook playbook.yml -u ssh-admin
```

[k8s]

## Install k8s cluster on VMs

```
cd k8s-cluster
ansible-playbook playbook/site.yml -i inventory.yml
```

> If the worker's do not labeled as worker

```
kubectl label node node02 node-role.kubernetes.io/worker=worker
kubectl label node node03 node-role.kubernetes.io/worker=worker
```

[namespaces]

## Create namespaces by terraform

### providers

- hashicorp/kubernetes

```
cd makeup/k8s
terraform init
terraform plan
terraform apply --auto-approve
```

[monitoring]

## Implement monitoring stack base on prometheus, grafana and alert manager by terraform:

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

- [ ] make it automate

```
kubectl expose service/kube-prometheus-stack-prometheus -n monitoring --type=NodePort --target-port=9090 --name=prometheus-ext
kubectl expose service/kube-prometheus-stack-grafana -n monitoring --type=NodePort --target-port=3000 --name=grafana-ex
kubectl expose service/alertmanager-operated -n monitoring --type=NodePort --target-port=9093 --name=alert-manager-ex
```

All services are accessible from control plane IP address and a random port
http://192.168.122.200:<RANDOM_PORT>/

## Retrieve grafana username, password

```
kubectl get secret -n monitoring kube-prometheus-stack-grafana -o jsonpath='{.data.admin-user}' | base64 -d
kubectl get secret -n monitoring kube-prometheus-stack-grafana -o jsonpath='{.data.admin-password}' | base64 -d
```

- username: admin
- password: prom-operator

[postgres-ha]

## Implement postgres cluster by terraform:

### providers

- hashicorp/kubernetes
- hashicorp/helm

### helm

- repo: https://charts.bitnami.com/bitnami
- chart: postgresql-ha

http://192.168.122.200:<RANDOM_PORT>/
kubectl expose service/postgres-ha-postgresql-ha-postgresql -n postgres-ha --type=NodePort --target-port=5432 --name=postgres-ext

## Retrieve postgres username, password

```
kubectl get secret -n postgres-ha postgres-ha-postgresql-ha-postgresql -o jsonpath='{.data.password}' | base64 -d
```

- username: postgres
- password:

[App]

## Create python virtual environments

```
cd application
python3 -m venv .env
```

## Install requirements

```
pip install -r requirements.txt
```

## Start app in env mode

```
source .env/bin/activate
.env/bin/uvicorn main:app --reload
```
