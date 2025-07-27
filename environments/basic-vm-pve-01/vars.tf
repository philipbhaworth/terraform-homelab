variable "enabled" {
  description = "Whether to create the VMs"
  type        = bool
  default     = true
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "docker"
}

variable "target_node" {
  description = "Name of the Proxmox node to create VMs on"
  type        = string
  default     = "pve-01"
}

variable "vmid_start" {
  description = "The starting VM ID for created VMs"
  type        = number
  default     = 400
}

variable "description" {
  description = "Description for the VM"
  type        = string
  default     = "Docker node created by Terraform"
}

variable "iso_file" {
  description = "ISO file to boot from"
  type        = string
  default     = "local:iso/ubuntu-24-04-2-autoinstall-phil-01.iso"
}

variable "cpu_cores" {
  description = "Number of CPU cores per VM"
  type        = number
  default     = 2
}

variable "cpu_type" {
  description = "The CPU type to use"
  type        = string
  default     = "host"
}

variable "memory" {
  description = "Amount of memory in MB per VM"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Size of the disk in GB per VM"
  type        = number
  default     = 40
}

variable "disk_ssd" {
  description = "Whether the disk should be treated as an SSD"
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
  default     = true
}

variable "storage" {
  description = "Name of the storage to use"
  type        = string
  default     = "dpool01"
}

variable "os_type" {
  description = "The type of operating system"
  type        = string
  default     = "l26"
}

variable "agent_enabled" {
  description = "Whether to enable the QEMU guest agent"
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
  default     = "docker,terraform"
}

# API Configuration
variable "api_url" {
  description = "URL to Proxmox API"
  type        = string
  default     = "https://192.168.50.10:8006"
}

variable "token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "token_id" {
  description = "Proxmox API token ID"
  type        = string
}
