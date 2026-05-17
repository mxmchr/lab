variable "name" {
  description = "Nom du stack Portainer"
  type        = string
}

variable "endpoint_id" {
  description = "ID de l'endpoint Portainer où le stack doit être déployé"
  type        = number
  default = null
}

variable "environment_name" {
  description = "Nom de l'environnement Portainer où le stack doit être déployé"
  type        = string
}

variable "deployment_type" {
  description = "Type de déploiement pour le stack Portainer (ex: compose, swarm, kubernetes)"
  type        = string
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

variable "repository_url" {
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
  type        = bool
  default     = false
}

variable "update_interval" {
  description = "Intervalle de mise à jour pour le stack Portainer (en secondes)"
  type        = string  
  default     = null
}

variable "pull_image" {
  description = "Indique si les images doivent être tirées à chaque mise à jour du stack Portainer"
  type        = bool  
  default     = false
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

variable "env" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}



