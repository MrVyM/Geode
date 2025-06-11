
variable "target_node" {
  description = "The name of the target node"
  type        = string
}

variable "vm_user" {
  type    = string
  default = "vym"
}

variable "ssh_keys" {
  type = list(string)
  default = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCU9W23J84wcMbCBTscwGllcSie9pf+uwvo9giaSAEiXX93fSx6RWRqV0GgrZEzhIcykydpaqjt3YuJu87HJUaonfEPvDeMdzzolMo603l76a4IKxDXQZhjjyy9q7k/TfItWa17hH38MOrhinQPY+s4p4w8S7ML7eQFRqBtVu6awBr44umkHogh7he19Da2NG+t4FzAPC8IvhGQLLxEGCkrx53JhounS201U5TC1EplyR4OukEUKlTtrQrxJZfk+OAelcQQtYju4pOgMZTA/h+d7QwL61nAwxgCtA6BcFW5HxYMIikDZ1BiV2pClZCOKbb4ulgdFV/HL2c/+nDZf0fv openpgp:0x8F7BCA15",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJTpb80oe0sQTdKrxBZVsgQDtw1oOvxBosu+FhilIG6g vym@opale"
  ]
}

variable "domain" {
  description = "The main domain name"
  type        = string
}

## -------------- PROXMOX ---------------

variable "proxmox_endpoint" {
  description = "The proxmox domain for managing"
  type        = string
}

variable "proxmox_user_realms" {
  description = "Realm use by the proxmox user"
  type        = string
  default     = "pam"
}

variable "proxmox_username" {
  description = "User to connect Proxmox "
  type        = string
}

variable "proxmox_password" {
  description = "Secret password to connect Proxmox "
  type        = string
}

## -------------- K3S ---------------

variable "k3s_masters" {
  description = "Number of master in k3s"
  type        = number
  default     = 1
}

variable "k3s_masters_memory" {
  description = "Amount of memory in master in k3s"
  type        = number
  default     = "4096"
}

variable "k3s_nodes" {
  description = "Number of nodes in k3s"
  type        = number
  default     = 3
}

variable "k3s_nodes_memory" {
  description = "Amount of memory in nodes in k3s"
  type        = number
  default     = "4096"
}

variable "k3s_masters_cpu" {
  description = "Number of CPU per master"
  default     = 2
}

variable "k3s_nodes_cpu" {
  description = "Number of CPU per nodes"
  default     = 2
}
