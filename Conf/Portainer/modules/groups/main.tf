resource "portainer_endpoint_group" "this" {
  name        = var.group_name
  description = var.group_description
}