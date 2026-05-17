############################################
### Variables for Terraform Backend ###
############################################

variable "s3_access_key" {
  description = "Clé d'accès S3"
  type        = string
}

variable "s3_secret_key" {
  description = "Secret S3"
  type        = string
  sensitive   = true
}

variable "s3_endpoint" {
  description = "Endpoint S3"
  type        = string
}

############################################
###  Portainer Environments ###
############################################

variable "environments" {
  type = map(object({
    environment_address = string
    public_ip           = string
    type                = number
    group_id            = optional(number, 1)
  }))
  
}

############################################
### Variables pour Portainer ###
############################################

variable "stacks" {
  type = map(object({
    deployment_type         = string
    environment_name        = string
    method                  = string
    repository_url          = string
    git_username_wo         = string
    git_password_wo         = string
    file_path_in_repository = string
    stack_webhook           = bool
    repository_wo_version   = number

    env = optional(list(object({
      name  = string
      value = string
    })))
  }))
}

variable "portainer_endpoint" {
  description = "Endpoint Portainer"
  type        = string
}

variable "portainer_api_key" {
  description = "Clé API Portainer"
  type        = string
  sensitive   = true
}

variable "portainer_backup_password" {
  description = "Mot de passe pour le backup Portainer"
  type        = string
  sensitive   = true
}

variable "output_path" {
  description = "Chemin de sortie pour le backup Portainer"
  type        = string
  default     = "backup.tar.gz"
}

variable "authentication_method" {
  description = "Méthode d'authentification pour Portainer (ex: 'internal', 'oauth')"
  type        = number
  default     = 3
}

variable "enable_telemetry" {
  description = "Indique si la télémétrie est activée dans Portainer"
  type        = bool
  default     = false
}

variable "snapshot_interval" {
  description = "Intervalle de snapshot pour Portainer (ex: '15m', '1h')"
  type        = string
  default     = "15m"
}

variable "user_session_timeout" {
  description = "Durée avant expiration de la session utilisateur dans Portainer (ex: '8h', '1d')"
  type        = string
  default     = "8h"
}

variable "logo_url" {
  description = "URL du logo personnalisé pour Portainer"
  type        = string
  default     = null
}

variable "required_password_length" {
  description = "Longueur minimale requise pour les mots de passe dans Portainer"
  type        = number
  default     = 20
}

variable "sso" {
  description = "Indique si l'authentification unique (SSO) est activée"
  type        = bool
  default     = true
}

variable "oauth_auto_create_users" {
  description = "Indique si les utilisateurs doivent être créés automatiquement lors de la connexion via OAuth"
  type        = bool
  default     = true
}

variable "oauth_client_id" {
  description = "ID client pour OAuth"
  type        = string
}

variable "oauth_client_secret" {
  description = "Secret client pour OAuth"
  type        = string
  sensitive   = true
}

variable "oauth_authorization_uri" {
  description = "URI d'autorisation pour OAuth"
  type        = string
}

variable "oauth_access_token_url" {
  description = "URL pour obtenir le token d'accès OAuth"
  type        = string
}

variable "oauth_resource_uri" {
  description = "URI de la ressource pour OAuth"
  type        = string
}

variable "oauth_redirect_uri" {
  description = "URI de redirection pour OAuth"
  type        = string
}

variable "oauth_logout_uri" {
  description = "URI de déconnexion pour OAuth"
  type        = string
}

variable "oauth_user_identifier" {
  description = "Identifiant de l'utilisateur pour OAuth (ex: email)"
  type        = string
}

variable "oauth_scopes" {
  description = "Scopes pour OAuth"
  type        = string
}

variable "oauth_auth_style" {
  description = "Style d'authentification pour OAuth (ex: 'auto', 'in_header', 'in_params')"
  type        = number
  default     = 0
}

############################################
### Portainer Registry ###
############################################

variable "registries" {
  type = map(object({
    type                    = number
    registry_url            = string
    registry_authentication = bool
    registry_username       = string
    registry_password       = string
  }))
}