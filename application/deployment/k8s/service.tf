resource "kubernetes_service" "ip-finder-ex" {
  metadata {
    name = var.svc-name
  }
  spec {
    selector = {
      app = var.name
    }
    session_affinity = "ClientIP"
    port {
      port      = var.port
      node_port = var.node-port
    }
    type = "NodePort"
  }
}
