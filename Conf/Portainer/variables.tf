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
### Variables pour Portainer ###
############################################

variable "stacks" {
  type = map(object({
    deployment_type         = string
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

############################################