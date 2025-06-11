resource "proxmox_virtual_environment_file" "k3s-masters-cloud-init" {
  count        = var.k3s_masters
  node_name    = var.target_node
  content_type = "snippets"
  datastore_id = "local"
  source_raw {
    file_name = "k3s-master-${count.index}-cloud-config.yml"
    data = templatefile("./template/cloud-init.cfg", {
      hostname = "k3s-master-${count.index}"
      username = var.vm_user
      ssh_keys = var.ssh_keys
    })
  }
}

resource "proxmox_virtual_environment_file" "k3s-nodes-cloud-init" {
  count        = var.k3s_nodes
  node_name    = var.target_node
  content_type = "snippets"
  datastore_id = "local"
  source_raw {
    file_name = "k3s-node-${count.index}-cloud-config.yml"
    data = templatefile("./template/cloud-init.cfg", {
      hostname = "k3s-node-${count.index}"
      username = var.vm_user
      ssh_keys = var.ssh_keys
    })
  }
}
