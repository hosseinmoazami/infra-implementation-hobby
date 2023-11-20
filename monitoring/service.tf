# resource "kubernetes_service" "prom-svc-ext" {
#   metadata {
#     name      = var.prom-svc-name
#     namespace = var.namespace
#   }
#   spec {
#     selector = {
#       #       app = "kube-prometheus-stack-prometheus"
#     }
#     session_affinity = "ClientIP"
#     port {
#       port        = var.prom-port
#       target_port = var.prom-port
#       node_port   = var.prom-node-port
#     }
#     type = "NodePort"
#   }
# }

# resource "kubernetes_service" "graf-svc-ext" {
#   metadata {
#     name      = "monitoring-stack-grafana"
#     namespace = var.namespace
#   }
#   spec {
#     selector = {
#       app = var.graf-name
#     }

#     port {
#       port        = var.graf-port
#       target_port = var.graf-port
#       node_port   = var.graf-node-port
#     }
#     type = "LoadBalancer"
#   }
# }

# resource "kubernetes_service" "altman-svc-ext" {
#   metadata {
#     name      = var.altman-svc-name
#     namespace = var.namespace
#   }
#   spec {
#     type = "NodePort"
#     selector = {
#       app = var.altman-name
#     }
#     port {
#       port        = var.altman-port
#       target_port = var.altman-port
#       node_port   = var.altman-node-port
#     }
#   }
# }
