locals {
  files = fileset("${path.module}", "*")
}

resource "github_repository_file" "terraform-files-and-tfvars" {
  for_each = local.files

  repository          = var.git_repo_url
  branch              = "master"
  file                = "13-terraform/${each.value}"
  content             = file("${path.module}/${each.value}")
  commit_message      = "Managed by Terraform"
  commit_author       = "Vladislav Stroev"
  commit_email        = "Nupalolz@gmail.com"
  overwrite_on_create = true
}