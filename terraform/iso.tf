resource "proxmox_virtual_environment_download_file" "ubuntu_22-04_lxc" {
  content_type = "vztmpl"
  datastore_id = "local-btrfs"
  node_name    = var.target_node
  url          = "http://download.proxmox.com/images/system/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

resource "proxmox_virtual_environment_download_file" "debian_12-7-1_lxc" {
  content_type = "vztmpl"
  datastore_id = "local-btrfs"
  node_name    = var.target_node
  url          = "http://download.proxmox.com/images/system/debian-12-standard_12.7-1_amd64.tar.zst"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_22-04_img" {
  content_type = "iso"
  datastore_id = "local-btrfs"
  node_name    = var.target_node
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}
