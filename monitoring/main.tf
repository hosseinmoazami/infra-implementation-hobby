resource "helm_release" "kube-prometheus" {
  name       = "monitoring-stack"
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}

