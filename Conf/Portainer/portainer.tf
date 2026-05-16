module "portainer_stacks" {
  source = "./modules/stacks"

  name = var.name
  deployment_type = var.deployment_type
  method = var.method
  repository_url = var.repository_url
  git_username_wo = var.git_username_wo
  git_password_wo = var.git_password_wo
  file_path_in_repository = var.file_path_in_repository
  stack_webhook = var.stack_webhook
  repository_wo_version = var.repository_wo_version
}

# resource "portainer_backup" "backup" {
#   password    = var.portainer_backup_password
#   output_path = var.output_path
# }