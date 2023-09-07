resource "kubernetes_namespace" "wcg_ns" {
  count = var.create_index ? 1 : 0
  
  metadata {
    labels = local.labels
    name   = "${local.prefix}-namespace"
  }
}