variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHOt6XoEMI8DJKG6i9My3DGxVOmNeZzXEy0BovZfw09e"
}

# Define all available nodes
variable "available_nodes" {
  description = "All available Proxmox nodes"
  default     = ["pve-01", "pve-02", "pve-03", "pve-04"]
  type        = list(string)
}

# Define which nodes to use for current deployment
# Common patterns: ["pve-01"], ["pve-02"], ["pve-03"], ["pve-04"], or ["pve-02", "pve-03"]
variable "target_nodes" {
  description = "Nodes to deploy to for this run"
  default     = ["pve-01"] # Default to single node deployment
  type        = list(string)

  validation {
    condition = alltrue([
      for node in var.target_nodes : contains(var.available_nodes, node)
    ])
    error_message = "All target nodes must be in the available_nodes list."
  }
}

# Template mapping for all nodes
variable "template_mapping" {
  description = "VM template to use on each node"
  default = {
    "pve-01" = "ubu-2404-template"
    "pve-02" = "ubu-2404-template"
    "pve-03" = "ubu-2404-template"
    "pve-04" = "ubu-2404-template"
  }
  type = map(string)
}

# Storage mapping for all nodes
variable "storage_mapping" {
  description = "Storage pool to use on each node"
  default = {
    "pve-01" = "dpool01"
    "pve-02" = "VMdata02"
    "pve-03" = "VMdata03"
    "pve-04" = "VMdata04" # Update this to your actual pve-04 storage name
  }
  type = map(string)
}

variable "nic_name" {
  description = "Network bridge name"
  default     = "vmbr0"
  type        = string
}

variable "api_url" {
  description = "URL to Proxmox API"
  type        = string
  default     = "https://192.168.50.10:8006/api2/json"
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
