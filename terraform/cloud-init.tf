resource "proxmox_virtual_environment_file" "ubuntu_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.target_node

  source_file {
    path = "./template/cloud-init.yml"
  }
}
