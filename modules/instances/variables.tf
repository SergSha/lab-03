# variable "folder_id" {
#   type = string
# }

variable "vpc_name" {
  type = string
  description = "VPC name"
}

variable "zone" {
  type = string
  default = "ru-central1-b"
  description = "zone"
}

variable "subnet_name" {
  type = string
  description = "subnet name"
}

variable "subnet_id" {
  type = string
  description = "subnet id"
}

variable "subnet_cidrs" {
  type = list(string)
  description = "CIDRs"
}
/*
variable "subnet_cidrs" {}
*/
## VM parameters
variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "cpu" {
  description = "VM CPU count"
  default     = 2
  type        = number
}

variable "memory" {
  description = "VM RAM size"
  default     = 2
  type        = number
}

variable "core_fraction" {
  description = "Core fraction, default 100%"
  default     = 100
  type        = number
}

variable "disk" {
  description = "VM Disk size"
  default     = 10
  type        = number
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "network-ssd"
}
variable "secondary_disk" {
  description = "Additional secondary disk to attach to the instance"
  type        = map(map(string))
  default     = {}
}
variable "allow_stopping_for_update" {
  description = "If true, allows Terraform to stop the instance in order to update its properties. If you try to update a property that requires stopping the instance without setting this field, the update will fail."
  type        = bool
  default     = true
}

# yc compute image list --folder-id standard-images

#variable "image_id" {
#  description = "Default image ID Ubuntu 20"
#  default     = "fd879gb88170to70d38a" # ubuntu-20-04-lts-v20220404
#  type        = string
#}

#variable "image_id" {
#  description = "Default image ID Debian 11"
#  default     = "fd83u9thmahrv9lgedrk" # debian-11-v20230814
#  type        = string
#}

#variable "image_id" {
#  description = "Default image ID AlmaLinux 9"
#  default     = "fd8cvn7c0lb5ub3ip3kn" # almalinux-9-v20230911
#  type        = string
#}

variable "image_id" {
  description = "Default image ID AlmaLinux 8"
  default     = "fd84itfojin92kj38vmb" # almalinux-8-v20230925
  type        = string
}

#variable "image_id" {
#  description = "Default image ID CentOS 7"
#  default     = "fd85qh2iveusn11jcup6" # centos-7-v20230911
#  type        = string
#}

variable "nat" {
  type    = bool
  default = true
}

variable "platform_id" {
  type    = string
  default = "standard-v3"
}

variable "internal_ip_address" {
  type    = string
  default = null
}

variable "nat_ip_address" {
  type    = string
  default = null
}

variable "vm_user" {
  type        = string
  description = "vm user"
  default = ""
}

variable "ssh_public_key" {
  type        = string
  description = "cloud-config ssh public key"
  default = ""
}

variable "ssh_private_key" {
  type        = string
  description = "cloud-config ssh private key"
  default = ""
}