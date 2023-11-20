terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.15.0"
    }
  }
}

provider "kubernetes" {
  config_path    = var.kubeConfig
  config_context = var.kubeContext
}
