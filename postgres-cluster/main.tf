resource "helm_release" "postgres-ha" {
  name       = "postgres-ha"
  namespace  = var.namespace
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql-ha"
}
