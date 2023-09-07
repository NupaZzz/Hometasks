resource "github_repository_file" "terraform-files" {
  for_each = fileset("${path.module}", "*.tf")

  repository          = var.git_repo_url
  branch              = var.git_branch
  file                = "${var.git_dir}/${each.value}"
  content             = file("${path.module}/${each.value}")
  commit_message      = var.git_commit
  commit_author       = var.git_author
  commit_email        = var.git_email
  overwrite_on_create = true
}

resource "github_repository_file" "terraform-tfvars" {
  for_each = fileset("${path.module}", "*.tfvars")

  repository          = var.git_repo_url
  branch              = var.git_branch
  file                = "${var.git_dir}/${each.value}"
  content             = file("${path.module}/${each.value}")
  commit_message      = var.git_commit
  commit_author       = var.git_author
  commit_email        = var.git_email
  overwrite_on_create = true
}