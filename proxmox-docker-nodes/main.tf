terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.api_url
  pm_api_token_id     = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "my_vm" {
  # VM Basic Configuration
  name        = "docker-01"
  target_node = var.target_nodes[0] # Uses first node from target_nodes list
  desc        = "VM created by Terraform"

  # Hardware Configuration
  memory  = 4096
  balloon = 0 # Disable memory ballooning
  agent   = 1
  cores   = 2
  sockets = 1
  cpu     = "host"

  # Disk configuration for fresh installation
  disk {
    size    = "40G"
    type    = "virtio"
    storage = var.storage_mapping[var.target_nodes[0]]
    ssd     = 1
    slot    = 0
  }

  # CD-ROM configuration
  disk {
    type    = "ide"
    size    = "4M"
    storage = "local"
    file    = "ubuntu-24-04-2-autoinstall-phil-01.iso"
    media   = "cdrom"
    slot    = 2
  }

  # Network configuration using variable
  network {
    model    = "virtio"
    bridge   = var.nic_name # Uses vmbr0 from vars
    firewall = true
  }

  # OS and Boot Configuration
  os_type = "l26"
  boot    = "order=virtio0;ide2"

  # No cloud-init for fresh ISO installation
  # The VM will get a fresh IP via DHCP or manual configuration during install

  # Lifecycle management
  lifecycle {
    ignore_changes = [
      network, # Ignore network changes after creation
    ]
  }
}

output "vm_id" {
  value = proxmox_vm_qemu.my_vm.vmid
}

output "vm_ip" {
  value       = proxmox_vm_qemu.my_vm.default_ipv4_address
  description = "VM IP address"
}

# For dynamic creation, use this output instead:
# output "vm_details" {
#   value = {
#     for k, v in proxmox_vm_qemu.my_vm : k => {
#       vmid = v.vmid
#       ip   = v.default_ipv4_address
#     }
#   }
# }
