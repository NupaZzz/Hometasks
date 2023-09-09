resource "kubernetes_deployment" "word_cloud_generator" {
  count = var.create_index ? 1 : 0

  metadata {
    name = var.deployment_name
    namespace = kubernetes_namespace.wcg_ns[count.index].metadata[0].name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.container_name
          image = "${var.image_rep}:${var.container_tag}"
          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}