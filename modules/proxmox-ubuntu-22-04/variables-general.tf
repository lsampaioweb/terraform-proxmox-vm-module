variable "target_node" {
  description = "The node in the Proxmox cluster to create the VM."
  type        = string
  default     = "kvm-01"
}

variable "name" {
  description = "Name of the VM during creation."
  type        = string
}

variable "vmid" {
  description = "The ID of the VM in Proxmox. The default value of 0 indicates it should use the next available ID in the sequence."
  type        = number
  default     = 0
}

variable "desc" {
  description = "The description of the VM. Shows as the 'Notes' field in the Proxmox GUI."
  type        = string
  default     = "Ubuntu 22.04 VM generated by Terraform"
}

variable "onboot" {
  description = "Whether to have the VM startup after the PVE node starts."
  type        = bool
  default     = false
}

variable "oncreate" {
  description = "Whether to have the VM startup after the VM is created."
  type        = bool
  default     = true
}

variable "pool" {
  description = "Name of resource pool to create virtual machine in."
  type        = string
  default     = "Stagging"
}
