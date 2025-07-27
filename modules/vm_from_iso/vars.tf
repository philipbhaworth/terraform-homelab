variable "enabled" {
  description = "Whether to create the VMs"
  type        = bool
  default     = false
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "vm-iso"
}

variable "target_node" {
  description = "Name of the Proxmox node to create VMs on"
  type        = string
}

variable "vmid_start" {
  description = "The starting VM ID for created VMs"
  type        = number
  default     = 300
}

variable "description" {
  description = "Description for the VM"
  type        = string
  default     = ""
}

variable "iso_file" {
  description = "ISO file to boot from (e.g., 'local:iso/ubuntu-22.04-live-server-amd64.iso')"
  type        = string
}

variable "cpu_cores" {
  description = "Number of CPU cores per VM"
  type        = number
  default     = 2
}

variable "cpu_sockets" {
  description = "Number of CPU sockets per VM"
  type        = number
  default     = 1
}

variable "cpu_type" {
  description = "The CPU type to use (e.g., kvm64, host)"
  type        = string
  default     = "host"
}

variable "memory" {
  description = "Amount of memory in MB per VM"
  type        = number
  default     = 4096
}

variable "agent_enabled" {
  description = "Whether to enable the QEMU guest agent"
  type        = bool
  default     = true
}

variable "network_bridge" {
  description = "Name of the network bridge to use"
  type        = string
  default     = "vmbr0"
}

variable "enable_firewall" {
  description = "Whether to enable the firewall on the network device"
  type        = bool
  default     = false
}

variable "storage" {
  description = "Name of the storage to use"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Size of the disk in GB per VM"
  type        = number
  default     = 32
}

variable "additional_disk_size" {
  description = "Size of an additional disk in GB (0 to disable)"
  type        = number
  default     = 0
}

variable "disk_ssd" {
  description = "Whether the disk should be treated as an SSD"
  type        = bool
  default     = true
}

variable "vm_autostart" {
  description = "Whether to automatically start the VM after creation"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the VMs"
  type        = string
  default     = ""
}
