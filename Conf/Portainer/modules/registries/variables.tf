variable "registry_name" {
  description = "Nom du registre"
  type        = string
}

variable "type" {
  description = "Type de registre (ex: 'dockerhub', 'private')"
  type        = number
}

variable "registry_url" {
  description = "URL du registre"
  type        = string
}

variable "registry_authentication" {
  description = "Indique si l'authentification est requise pour le registre"
  type        = bool
  default     = true
}

variable "registry_username" {
  description = "Nom d'utilisateur pour le registre"
  type        = string
}

variable "registry_password" {
  description = "Mot de passe pour le registre"
  type        = string
  sensitive   = true
}