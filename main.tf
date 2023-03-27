
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "acr" {

  source                        = "./modules/container_registry"
  name                          = var.acr_name
  resource_group_name           = module.resource_group.name
  location                      = var.location
  public_network_access_enabled = var.public_network_access_enabled
  admin_enabled                 = var.admin_enabled
  sku                           = var.acr_sku

}

# data "docker_registry_image" "nginx" {
#   # name          = "${module.acr.login_server}/${docker_image.image}"
#   # keep_remotely = false

#   name = "nginx:latest"

# }

# resource "docker_image" "image" {
#   #name = "nginx/nginx-ingress"

#   name          = data.docker_registry_image.nginx.name
#   pull_triggers = [data.docker_registry_image.nginx.sha256_digest]
# }

resource "docker_registry_image" "helloworld" {
  name          = "${module.acr.login_server}/${docker_image.image.name}"
  keep_remotely = true
  depends_on = [
    docker_tag.tag
  ]
}

# resource "docker_image" "image" {
#   name = "nginx:latest"
# }

resource "docker_tag" "tag" {
  source_image  = "registry.k8s.io/ingress-nginx/controller:v1.3.0"
target_image = "${module.acr.login_server}/ingress-nginx/controller:v1.3.0"
}