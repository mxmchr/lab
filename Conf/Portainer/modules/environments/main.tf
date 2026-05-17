resource "portainer_environment" "docker_host" {
  name                = var.registry_name
  environment_address = var.environment_address
  public_ip           = var.public_ip
  type                = var.type
  group_id            = var.group_id
}