terraform {
  required_version = "~> 1.15"
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4"
    }
    portainer = {
      source = "portainer/portainer"
      version = "~> 1.29.0"
    }
  }
}

provider "portainer" {
  endpoint = var.portainer_endpoint
  api_key  = var.portainer_api_key
  skip_ssl_verify  = var.skip_ssl_verify
}