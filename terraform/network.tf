resource "proxmox_virtual_environment_network_linux_bridge" "vmbr1" {
  node_name  = var.target_node
  name       = "vmbr1"
  vlan_aware = true
  comment    = "VMs Lan"
}
