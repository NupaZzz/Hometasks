resource "kubernetes_service" "word_cloud_generator_service" {
  count = var.create_index ? 1 : 0

  metadata {
    name = var.service_name
    namespace = kubernetes_namespace.wcg_ns[count.index].metadata[0].name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      protocol    = var.service_proto
      port        = var.service_port
      target_port = var.container_port
    }

    type = var.service_type
  }
}