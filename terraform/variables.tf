
variable "target_node" {
  description = "The name of the target node"
  type        = string
}

variable "ssh_keys" {
  type = list(string)
  default = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCU9W23J84wcMbCBTscwGllcSie9pf+uwvo9giaSAEiXX93fSx6RWRqV0GgrZEzhIcykydpaqjt3YuJu87HJUaonfEPvDeMdzzolMo603l76a4IKxDXQZhjjyy9q7k/TfItWa17hH38MOrhinQPY+s4p4w8S7ML7eQFRqBtVu6awBr44umkHogh7he19Da2NG+t4FzAPC8IvhGQLLxEGCkrx53JhounS201U5TC1EplyR4OukEUKlTtrQrxJZfk+OAelcQQtYju4pOgMZTA/h+d7QwL61nAwxgCtA6BcFW5HxYMIikDZ1BiV2pClZCOKbb4ulgdFV/HL2c/+nDZf0fv openpgp:0x8F7BCA15"
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

variable "proxmox_password" {
  description = "Secret password to connect Proxmox "
  type        = string
}

variable "proxmox_api_token" {
  type = string
}
