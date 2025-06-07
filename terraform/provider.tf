terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.3.0"
    }
  }
  required_version = ">= 0.14"
}

provider "proxmox" {
  # TODO: Create a pve user
  endpoint  = "https://${var.proxmox_endpoint}"
  api_token = var.proxmox_api_token
  insecure  = true
}
