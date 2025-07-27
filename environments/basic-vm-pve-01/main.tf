terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.46.4"
    }
  }
}

provider "proxmox" {
  endpoint  = var.api_url
  api_token = "${var.token_id}=${var.token_secret}"
  insecure  = true
}

module "docker_nodes" {
  source = "../../modules/vm_from_iso"

  enabled        = var.enabled
  vm_count       = var.vm_count
  vm_name_prefix = var.vm_name_prefix
  target_node    = var.target_node
  vmid_start     = var.vmid_start
  description    = var.description

  # ISO Configuration
  iso_file = var.iso_file

  # Hardware Configuration
  cpu_cores = var.cpu_cores
  cpu_type  = var.cpu_type
  memory    = var.memory
  disk_size = var.disk_size
  disk_ssd  = var.disk_ssd

  # Network Configuration
  network_bridge  = var.network_bridge
  enable_firewall = var.enable_firewall

  # Storage Configuration
  storage = var.storage

  # Agent and startup
  agent_enabled = var.agent_enabled
  vm_autostart  = var.vm_autostart

  # Tags
  tags = var.tags
}
