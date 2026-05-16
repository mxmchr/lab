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

variable "name" {
  description = "Nom de la stack Portainer"
  type        = string  
}

variable "deployment_type" {
  description = "Type de déploiement (standalone ou swarm)"
  type        = string
}

variable "method" {
  description = "Méthode de déploiement (repository ou file)"
  type        = string
}

variable "repository_url" {
  description = "URL du repository Git pour le déploiement de la stack"
  type        = string
}

variable "git_username_wo" {
  description = "Nom d'utilisateur Git pour accéder au repository"
  type        = string
}

variable "git_password_wo" {
  description = "Mot de passe Git pour accéder au repository"
  type        = string
  sensitive   = true
}

variable "file_path_in_repository" {
  description = "Chemin du fichier docker-compose.yml dans le repository Git"
  type        = string
}

variable "stack_webhook" {
  description = "Indique si la stack doit être déployée avec un webhook (true ou false)"
  type        = bool
  default     = false
}

variable "repository_wo_version" {
  description = "Version du dépôt Git pour le stack Portainer (ex: branche, tag, commit)"
  type        = number
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