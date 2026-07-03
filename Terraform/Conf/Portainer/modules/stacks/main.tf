data "portainer_environment" "this" {
  name = var.environment_name
}

resource "portainer_stack" "standalone_repo_ephemeral" {
  name                          = var.name
  deployment_type               = var.deployment_type
  method                        = var.method
  endpoint_id                   = data.portainer_environment.this.id

  repository_url                = var.repository_url
  repository_username_wo        = var.git_username_wo
  repository_password_wo        = var.git_password_wo
  repository_wo_version         = var.repository_wo_version

  repository_reference_name     = var.repository_reference_name
  file_path_in_repository       = var.file_path_in_repository
  tlsskip_verify                = false

  stack_webhook                 = var.stack_webhook
  update_interval               = var.update_interval
  pull_image                    = var.pull_image
  force_update                  = var.force_update
  git_repository_authentication = true

  dynamic "env" {
    for_each = var.env != null ? var.env : []
    content {
      name  = env.value.name
      value = sensitive(env.value.value)
    }
  }
}