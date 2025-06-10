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
  endpoint = "https://${var.proxmox_endpoint}"
  username = "${var.proxmox_username}@${var.proxmox_user_realms}"
  password = var.proxmox_password
  insecure = true

  ssh {
    agent    = true
    username = var.proxmox_username
  }
}
