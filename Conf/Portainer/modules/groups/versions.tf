terraform {
  required_version = "~> 1.15"
  required_providers {
    portainer = {
      source  = "portainer/portainer"
      version = "~> 1.29.0"
    }
  }
}