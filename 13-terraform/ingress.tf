resource "kubernetes_ingress_v1" "word_cloud_generator_service" {
  count = var.create_index ? 1 : 0

  metadata {
    name = var.ingress_name
    namespace = kubernetes_namespace.wcg_ns[count.index].metadata[0].name
  }

  spec {
    rule {
      host = var.ingress_host
      http {
        path {
          path  = var.ingress_path
          path_type = var.ingress_type
          backend {
            service {
              name = var.service_name
              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}