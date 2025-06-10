resource "proxmox_virtual_environment_download_file" "ubuntu_22-04_lxc" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.target_node
  url          = "http://download.proxmox.com/images/system/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

resource "proxmox_virtual_environment_download_file" "debian_12-7-1_lxc" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.target_node
  url          = "http://download.proxmox.com/images/system/debian-12-standard_12.7-1_amd64.tar.zst"
}

resource "proxmox_virtual_environment_file" "ubuntu_22-04_img" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.target_node

  source_file {
    path      = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
    file_name = "jammy-server-cloudimg-amd64.img"
    checksum  = "3c35baa64e58e594e523be5c61fa5f18efdfbc1be3d96a4211fd19e0b3f295e0"
  }
}
