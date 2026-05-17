data "portainer_endpoint_group" "this" {
  name = var.group_name
}

resource "portainer_environment" "docker_host" {
  name                = var.registry_name
  environment_address = var.environment_address
  public_ip           = var.public_ip
  type                = var.type
  group_id            = data.portainer_endpoint_group.this.id
}