resource "local_file" "hosts_cfg" {
  content = templatefile("./template/inventory.cfg",
    {
      k8s_masters_ips = [for instance in proxmox_virtual_environment_vm.k3s-masters-vm : instance.ipv4_addresses[1][0]]
      k8s_nodes_ips   = [for instance in proxmox_virtual_environment_vm.k3s-nodes-vm : instance.ipv4_addresses[1][0]]
      ansible_user    = var.vm_user
    }
  )
  filename = "../ansible/inventory/hosts.cfg"
}

output "k8s-masters-ips" {
  value = join("\n", [for instance in proxmox_virtual_environment_vm.k3s-masters-vm : instance.ipv4_addresses[1][0]])
}
