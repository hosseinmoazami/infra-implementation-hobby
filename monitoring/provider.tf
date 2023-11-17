terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.15.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }
}
provider "helm" {
  kubernetes {
    config_path = var.kubeConfig
  }
}

provider "kubernetes" {
  config_path    = var.kubeConfig
  config_context = var.kubeContext
}
