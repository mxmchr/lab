variable "registry_name" {
  description = "Nom du registre"
  type        = string
}

variable "environment_address" {
  description = "Adresse de l'environnement Docker"
  type        = string
}

variable "public_ip" {
  description = "IP publique de l'environnement"
  type        = string
}

variable "type" {
  description = "Type de l'environnement (ex: 'docker', 'kubernetes')"
  type        = number
}

variable "group_id" {
  description = "ID du groupe à qui appartient l'environnement"
  type        = number
  default = 1
}
