resource "helm_release" "prom-stack" {
  name       = "monitoring"
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}

