# Geode

My own bubble with self-hosted stuff.
## Proxmox


You need to enable the snippets content on the local volume.
```sh
pvesm set local --content images,rootdir,vztmpl,backup,iso,snippets
```

## Terraform 

```sh
tofu init 
tofu plan 
tofu apply
```

### Destroy the cluster

```sh
tofu destroy --target=proxmox_virtual_environment_vm.k3s-masters-vm
tofu destroy --target=proxmox_virtual_environment_vm.k3s-nodes-vm
```

## Ansible 
You need to import every collection for launching the playbook.
```sh
ansible-galaxy collection install -r collections/requirements.yml
```
## Todo
- [ ] Terraform
  - [x] Deploy n masters k3s
  - [x] Deploy n nodes k3s
  - [x] Templating a cloud-init file
  - [x] Generate a inventory for ansible
  - [ ] Deploy / Import the OPNSense VM
- [ ] Ansible 
  - [X] Import the [k3s-ansible](https://github.com/k3s-io/k3s-ansible.git) collection
- [ ] k3s
- [ ] Restic
