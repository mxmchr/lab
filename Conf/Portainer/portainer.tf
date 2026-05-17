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


resource "portainer_settings" "example" {
  authentication_method = 3
  enable_telemetry      = false
  snapshot_interval     = "15m"
  user_session_timeout  = "8h"

  internal_auth_settings {
    required_password_length = 20
  }

  oauth_settings {
    sso                     = var.sso
    oauth_auto_create_users = var.oauth_auto_create_users

    client_id               = var.oauth_client_id
    client_secret           = var.oauth_client_secret
    authorization_uri       = var.oauth_authorization_uri
    access_token_uri        = var.oauth_access_token_url
    resource_uri            = var.oauth_resource_uri
    redirect_uri            = var.oauth_redirect_uri
    logout_uri              = var.oauth_logout_uri
    user_identifier         = var.oauth_user_identifier
    scopes                  = var.oauth_scopes
    auth_style              = var.oauth_auth_style
  }
}

module "portainer_registry" {
  for_each = var.registries
  source   = "./modules/registries"

  registry_name           = each.key
  type                    = each.value.type
  registry_url            = each.value.registry_url
  registry_authentication = each.value.registry_authentication
  registry_username       = each.value.registry_username
  registry_password       = each.value.registry_password
}

# resource "portainer_backup" "backup" {
#   password    = var.portainer_backup_password
#   output_path = var.output_path
# }