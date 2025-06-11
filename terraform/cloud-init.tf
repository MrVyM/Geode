resource "proxmox_virtual_environment_file" "ubuntu_cloud_config" {
  depends_on   = [local_file.cloud_init]
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.target_node

  source_file {
    path = "./template/cloud-init.yml"
  }
}

resource "local_file" "cloud_init" {
  content = templatefile("./template/cloud-init.cfg",
    {
      ssh_keys = var.ssh_keys
      user     = var.vm_user
    }
  )
  filename = "./template/cloud-init.yml"
}
