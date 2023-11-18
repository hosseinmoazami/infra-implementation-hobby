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
  default = "postgres-ha"
}
