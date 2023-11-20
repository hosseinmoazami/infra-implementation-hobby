resource "kubernetes_deployment" "ip-finder" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels = {
      app = var.name
    }
  }

  spec {
    selector {
      match_labels = {
        app = var.name
      }
    }
    replicas = 3
    template {
      metadata {
        labels = {
          app = var.name
        }
      }
      spec {
        container {
          image             = var.image
          name              = var.name
          image_pull_policy = "Never"
          port {
            container_port = var.port
          }
          resources {
            requests = {
              cpu    = var.cpu
              memory = var.memory
            }
          }
        }
        # restart_policy = "Never"
      }
    }
  }
}
