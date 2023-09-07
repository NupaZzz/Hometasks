variable "deployment_name" {
  description = "The name of the deployment"
  type        = string
}

variable "replicas" {
  description = "The number of replicas for the deployment"
  type        = number
}

variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "env" {
  description = "The environment for label"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_tag" {
  description = "The Docker image for the container"
  type        = string
}

variable "container_port" {
  description = "The port number exposed by the container"
  type        = number
}

variable "image_rep" {
  description = "The image repository on git"
  type        = string
}

variable "service_name" {
  description = "The name of the service"
  type        = string
}

variable "service_port" {
  description = "The port number exposed by the service"
  type        = number
}

variable "service_proto" {
  description = "The protocol of the service"
  type        = string
}

variable "service_type" {
  description = "The service type"
  type        = string
}

variable "git_repo_url" {
  description = "The repo name"
  type        = string
}

variable "ingress_name" {
  description = "The ingress name"
  type        = string
}

variable "ingress_host" {
  description = "The ingress host"
  type        = string
}

variable "ingress_path" {
  description = "The ingress path"
  type        = string
}

variable "ingress_type" {
  description = "The ingress path type"
  type        = string 
}

variable "create_index" {
  type        = bool
  default     = true
}

variable "git_token" {
  description = "token"
  type        = string
  sensitive = true
}

variable "git_branch" {
  description = "The branch on github"
  type        = string
}

variable "git_dir" {
  description = "The directory on github"
  type        = string
}

variable "git_commit" {
  description = "Commit message on github"
  type        = string
}

variable "git_author" {
  description = "Author on github"
  type        = string
}

variable "git_email" {
  description = "Author email on github"
  type        = string
}
