resource "portainer_registry" "dockerhub" {
  name           = var.registry_name
  type           = var.type
  url            = var.registry_url
  authentication = var.registry_authentication
  username       = var.registry_username
  password       = sensitive(var.registry_password)
}