variable "kubeConfig" {
  type    = string
  default = "~/.kube/config"
}

variable "kubeContext" {
  type    = string
  default = "default"
}

variable "namespace" {
  type    = string
  default = "monitoring"
}

##########################################
#               Prometheus               #
##########################################
variable "prom-name" {
  type    = string
  default = "monitoring-stack-kube-prom-prometheus"
}

variable "prom-svc-name" {
  type    = string
  default = "prometheus-ext"
}

variable "prom-port" {
  type    = string
  default = "9090"
}

variable "prom-node-port" {
  type    = string
  default = "30100"
}

##########################################
#               Grafana                  #
##########################################
variable "graf-name" {
  type    = string
  default = "monitoring-stack-grafana"
}

variable "graf-svc-name" {
  type    = string
  default = "monitoring-stack-grafana"
}

variable "graf-port" {
  type    = string
  default = "3000"
}

variable "graf-node-port" {
  type    = string
  default = "30200"
}

##########################################
#               Alert Manager            #
##########################################
variable "altman-name" {
  type    = string
  default = "kube-prometheus-stack-alertmanager"
}

variable "altman-svc-name" {
  type    = string
  default = "alert-manager-ext"
}

variable "altman-port" {
  type    = string
  default = "9093"
}

variable "altman-node-port" {
  type    = string
  default = "30300"
}
