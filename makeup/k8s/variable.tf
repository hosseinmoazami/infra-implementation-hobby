variable "kubeConfig" {
  type    = string
  default = "~/.kube/config"
}

variable "kubeContext" {
  type    = string
  default = "default"
}

variable "namespaces" {
  default = {
    "monitoring" = {
      namespace = "monitoring"
      labels = {
        "group" = "infrastructure"
      }
    }
    "postgres-ha" = {
      namespace = "postgres-ha"
      labels = {
        "group" = "storage"
      }
    }
  }
}
