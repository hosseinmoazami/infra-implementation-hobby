variable "kubeConfig" {
  type    = string
  default = "~/.kube/config"
}

variable "kubeContext" {
  type    = string
  default = "default"
}

variable "name" {
  type    = string
  default = "ip-finder"
}

variable "svc-name" {
  type    = string
  default = "ip-finder-ex"
}

variable "namespace" {
  type    = string
  default = "web-api"
}

variable "image" {
  type    = string
  default = "web_api_ip_finder"
}

variable "port" {
  type    = string
  default = "8000"
}

variable "node-port" {
  type    = string
  default = "30200"
}

variable "cpu" {
  type    = string
  default = "250m"
}

variable "memory" {
  type    = string
  default = "10Mi"
}
