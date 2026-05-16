module "portainer_stacks" {
  for_each = var.stacks
  source   = "./modules/stacks"

  name                    = each.key
  deployment_type         = each.value.deployment_type
  method                  = each.value.method
  repository_url          = each.value.repository_url
  git_username_wo         = each.value.git_username_wo
  git_password_wo         = each.value.git_password_wo
  file_path_in_repository = each.value.file_path_in_repository
  stack_webhook           = each.value.stack_webhook
  repository_wo_version   = each.value.repository_wo_version

  env = try(each.value.env, null)
}

# resource "portainer_backup" "backup" {
#   password    = var.portainer_backup_password
#   output_path = var.output_path
# }