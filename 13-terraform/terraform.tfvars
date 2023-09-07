#Deploy var

deployment_name = "word-cloud-generator"
replicas        = 1
app_name        = "word-cloud-generator"
env             = "dev"
container_name  = "wcg"
container_tag   = "latest"
container_port  = 8888
image_rep       = "ghcr.io/nupazzz/wcg"

#Ingress var

ingress_name    = "word-cloud-generator-ingress"
ingress_host    = "localhost"
ingress_path    = "/wcg"
ingress_type    = "Prefix"

#Service var

service_name    = "word-cloud-generator-service"
service_port    = 8888
service_proto   = "TCP"
service_type    = "ClusterIP"

#Git var

git_token = "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"
git_repo_url    = "Hometasks"