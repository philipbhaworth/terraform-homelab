# Basic VM Environment - PVE-01

This environment creates standard virtual machines on the **pve-01** node using ISO installation. Perfect for any general-purpose VM deployment.

## Purpose

Deploy VMs to pve-01 using ISO-based installation. This is your template for any VM that needs a fresh OS install on the pve-01 host.

## What This Creates

- VMs on the pve-01 Proxmox node
- Fresh OS installation from ISO
- Configurable hardware specs
- Network connectivity on vmbr0
- QEMU guest agent support

## Prerequisites

- Proxmox VE with API access
- ISO file uploaded to Proxmox storage
- Terraform >= 1.0.0

## Quick Setup

1. **Copy example config:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Edit terraform.tfvars with your values:**
   ```hcl
   # VM Configuration
   enabled        = true
   vm_count       = 1
   vm_name_prefix = "myvm"

   # Hardware (adjust as needed)
   cpu_cores = 2
   memory    = 4096
   disk_size = 40

   # ISO file (must be uploaded to Proxmox first)
   iso_file = "local:iso/ubuntu-24-04-2-autoinstall-phil-01.iso"

   # API access (fill in your values)
   api_url      = "https://your-pve-ip:8006"
   token_id     = "your-token-id@pve!your-token-name"
   token_secret = "your-secret-token"
   ```

## Deployment

### Standard Workflow

```bash
# Navigate to this environment
cd environments/basic-vm-pve-01/

# Initialize Terraform
terraform init

# Review what will be created
terraform plan

# Create the VMs
terraform apply

# When done, remove everything
terraform destroy
```

## Post-Deployment

After `terraform apply` completes:

1. **Open Proxmox Web Interface**
   - Go to `https://your-pve-ip:8006`
   - Navigate to your VM(s)

2. **Complete OS Installation**
   - Click Console to access the VM
   - Follow OS installation steps
   - Install QEMU guest agent after OS setup

3. **Verify Success**
   ```bash
   terraform output  # Shows VM IDs and names
   ```

## Common Customizations

### Create Multiple VMs
```hcl
vm_count = 3  # Creates myvm-1, myvm-2, myvm-3
```

### More Resources
```hcl
cpu_cores = 4
memory    = 8192
disk_size = 80
```

### Add Second Disk
```hcl
additional_disk_size = 100  # Adds 100GB second disk
```

## Troubleshooting

### VM Won't Start
- Check ISO file exists: verify `iso_file` path
- Check storage space on pve-01
- Verify VM ID doesn't conflict with existing VMs

### API Issues
- Verify API URL: `https://your-pve-ip:8006`
- Check token permissions in Proxmox
- Test token with: `pvesh get /nodes`

### Useful Commands
```bash
# See what Terraform created
terraform state list

# Check specific VM details
terraform show

# Format your .tf files
terraform fmt

# Validate configuration
terraform validate
```

## Notes

- **Target Node**: Always deploys to pve-01
- **Storage**: Uses dpool01 storage on pve-01
- **Network**: Uses vmbr0 bridge
- **ISO Location**: Must be uploaded to Proxmox first
- **VM IDs**: Start at 400 by default (configurable)
