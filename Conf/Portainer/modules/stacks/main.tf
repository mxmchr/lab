data "portainer_environment" "watch" {
  name = "Watch"
}

resource "portainer_stack" "standalone_repo_ephemeral" {
  name                      = var.name
  deployment_type           = var.deployment_type
  method                    = var.method
  endpoint_id               = data.portainer_environment.watch.id

  repository_url_wo         = var.repository_url_wo
  repository_username_wo    = var.git_username_wo
  repository_password_wo    = var.git_password_wo
  repository_wo_version     = var.repository_wo_version

  repository_reference_name = var.repository_reference_name
  file_path_in_repository   = var.file_path_in_repository
  tlsskip_verify            = false

  stack_webhook             = var.stack_webhook
  update_interval           = var.update_interval
  pull_image                = var.pull_image
  force_update              = var.force_update
  git_repository_authentication = true
}