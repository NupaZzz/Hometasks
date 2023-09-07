resource "github_repository_file" "terraform-files" {
  for_each = fileset("${path.module}", "*.tf")

  repository          = var.git_repo_url
  branch              = "master"
  file                = "13-terraform/${each.value}"
  content             = file("${path.module}/${each.value}")
  commit_message      = "Managed by Terraform"
  commit_author       = "Vladislav Stroev"
  commit_email        = "Nupalolz@gmail.com"
  overwrite_on_create = true
}

resource "github_repository_file" "terraform-tfvars" {
  for_each = fileset("${path.module}", "*.tfvars")

  repository          = var.git_repo_url
  branch              = "master"
  file                = "13-terraform/${each.value}"
  content             = file("${path.module}/${each.value}")
  commit_message      = "Managed by Terraform"
  commit_author       = "Vladislav Stroev"
  commit_email        = "Nupalolz@gmail.com"
  overwrite_on_create = true
}