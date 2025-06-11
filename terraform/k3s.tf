resource "proxmox_virtual_environment_vm" "k3s-masters-vm" {
  count     = var.k3s_masters
  name      = "k3s-master-${count.index}"
  node_name = var.target_node
  vm_id     = 200 + count.index

  cpu {
    cores = var.k3s_masters_cpu
  }

  memory {
    dedicated = var.k3s_masters_memory
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"

    # NOTE: vlan_id = x
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_file.ubuntu_22-04_img.id
    interface    = "scsi0"
    size         = 5
    discard      = "on"
  }

  boot_order = ["scsi0"]

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.ubuntu_cloud_config.id
    interface         = "ide2"
  }
}

resource "proxmox_virtual_environment_vm" "k3s-nodes-vm" {
  count     = var.k3s_nodes
  name      = "k3s-worker-${count.index}"
  node_name = var.target_node
  vm_id     = 210 + count.index

  cpu {
    cores = var.k3s_nodes_cpu
  }

  memory {
    dedicated = var.k3s_nodes_memory
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"

    # NOTE: vlan_id = x
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_file.ubuntu_22-04_img.id
    size         = 5
    interface    = "scsi0"
    discard      = "on"
  }

  boot_order = ["scsi0"]

  serial_device {}
  # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = var.vm_user
      keys     = var.ssh_keys
      password = "test"
    }

    user_data_file_id = proxmox_virtual_environment_file.ubuntu_cloud_config.id
  }
}

