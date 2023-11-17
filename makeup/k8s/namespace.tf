resource "kubernetes_namespace" "namespace" {
  for_each = var.namespaces
  metadata {
    annotations = {
      name = each.key
    }
    name   = each.key
    labels = each.value.labels
  }
}
