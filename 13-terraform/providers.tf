terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }

    github = {
      source  = "integrations/github"
      version = "5.34.0"
    }
  }

  backend "kubernetes" {
    secret_suffix = "wcg"
    config_path   = "~/.kube/config"
    namespace     = "kube-system"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "github" {
  token = var.git_token
}