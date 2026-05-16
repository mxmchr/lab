variable "name" {
  description = "Nom du stack Portainer"
  type        = string
}

variable "deployment_type" {
  description = "Type de déploiement pour le stack Portainer (ex: compose, swarm, kubernetes)"
  type        = string  
  default     = "compose"
}

variable "method" {
  description = "Méthode de déploiement pour le stack Portainer (ex: repository, upload)"
  type        = string  
  default     = "repository"
}

variable "repository_wo_version" {
  description = "Version du dépôt Git pour le stack Portainer (ex: branche, tag, commit)"
  type        = number  
}

variable "repository_url_wo" {
  description = "URL du dépôt Git pour le stack Portainer"
  type        = string  
}

variable "git_username_wo" {
  description = "Nom d'utilisateur Git pour le stack Portainer"
  type        = string  
}

variable "git_password_wo" {
  description = "Mot de passe Git pour le stack Portainer"
  type        = string  
  sensitive   = true
}

variable "stack_webhook" {
  description = "Webhook pour le stack Portainer"
  type        = string  
}

variable "update_interval" {
  description = "Intervalle de mise à jour pour le stack Portainer (en secondes)"
  type        = string  
  default     = "10m"
}

variable "pull_image" {
  description = "Indique si les images doivent être tirées à chaque mise à jour du stack Portainer"
  type        = bool  
  default     = true
}

variable "force_update" {
  description = "Indique si le stack Portainer doit être mis à jour même si aucune modification n'est détectée"
  type        = bool  
  default     = false
}

variable "repository_reference_name" {
  description = "Nom de la référence du dépôt Git pour le stack Portainer (ex: branche, tag, commit)"
  type        = string  
  default     = "refs/heads/main"
}

variable "file_path_in_repository" {
  description = "Chemin du fichier de stack dans le dépôt Git pour le stack Portainer"
  type        = string  
  default     = "stack.yml"
}



