# VM from ISO Module

This module creates virtual machines in Proxmox VE by booting directly from ISO files. This is the foundation module for creating any type of VM that requires a fresh OS installation.

## Features

- Create VMs from ISO files (no templates required)
- Boot directly from installation media
- Customize CPU, memory, and disk settings
- Support for additional disks
- Network configuration
- Support for QEMU guest agent
- SSD emulation for better performance

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| proxmox | >= 0.46.4 |

## Usage

```hcl
module "my_vms" {
  source = "../../modules/vm_from_iso"

  enabled        = true
  vm_count       = 1
  target_node    = "pve-01"
  vm_name_prefix = "myvm"

  iso_file    = "local:iso/ubuntu-22.04-live-server-amd64.iso"
  cpu_cores   = 2
  memory      = 4096
  disk_size   = 40
  storage     = "local-lvm"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Whether to create the VMs | `bool` | `false` | no |
| vm_count | Number of VMs to create | `number` | `1` | no |
| vm_name_prefix | Prefix for VM names | `string` | `"vm-iso"` | no |
| target_node | Name of the Proxmox node to create VMs on | `string` | n/a | yes |
| vmid_start | The starting VM ID for created VMs | `number` | `300` | no |
| description | Description for the VM | `string` | `""` | no |
| iso_file | ISO file to boot from | `string` | n/a | yes |
| cpu_cores | Number of CPU cores per VM | `number` | `2` | no |
| cpu_sockets | Number of CPU sockets per VM | `number` | `1` | no |
| cpu_type | The CPU type to use | `string` | `"host"` | no |
| memory | Amount of memory in MB per VM | `number` | `4096` | no |
| agent_enabled | Whether to enable the QEMU guest agent | `bool` | `true` | no |
| network_bridge | Name of the network bridge to use | `string` | `"vmbr0"` | no |
| enable_firewall | Whether to enable the firewall on the network device | `bool` | `false` | no |
| storage | Name of the storage to use | `string` | `"local-lvm"` | no |
| disk_size | Size of the disk in GB per VM | `number` | `32` | no |
| additional_disk_size | Size of an additional disk in GB (0 to disable) | `number` | `0` | no |
| disk_ssd | Whether the disk should be treated as an SSD | `bool` | `true` | no |
| vm_autostart | Whether to automatically start the VM after creation | `bool` | `false` | no |
| tags | Tags to apply to the VMs | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_ids | The IDs of the created VMs |
| vm_names | The names of the created VMs |

## Notes

1. **ISO File**: Ensure your ISO file is uploaded to Proxmox storage before using this module
2. **Installation**: This module creates the VM with ISO attached - you'll need to complete OS installation via Proxmox console
3. **Boot Configuration**: VM boots from CD-ROM initially for proper installation
4. **Guest Agent**: Install QEMU guest agent in the VM after OS installation for better integration

---
