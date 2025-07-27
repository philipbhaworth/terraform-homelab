# Terraform Modules

This directory contains reusable Terraform modules for infrastructure components.

## Module Architecture

```
modules/vm_from_iso/     ← Reusable VM creation logic
    ├── main.tf          ← VM resource definitions
    ├── variables.tf     ← Input parameters
    └── outputs.tf       ← Return values

environments/basic-vm/   ← Specific deployment
    ├── main.tf          ← Calls the module with your settings
    ├── variables.tf     ← Environment-specific variables
    └── terraform.tfvars ← Your actual values
```

## How Modules Work

The **module** is a **reusable component** - think of it as a blueprint for creating VMs from ISOs.

The **environment** is a **specific deployment** that uses that module.

The module **feeds into** your environment. You can reuse the same module for different purposes!

## Available Modules

### vm_from_iso
Creates virtual machines in Proxmox VE by booting from ISO files. Perfect for:
- Standard VM deployments
- Custom OS installations
- Development environments
- Any scenario requiring fresh OS installation

## Usage Pattern

1. **Module defines HOW** to create infrastructure
2. **Environment defines WHAT** to create
3. **terraform.tfvars defines YOUR SPECIFIC VALUES**

This separation allows you to:
- Reuse modules across different projects
- Maintain consistent infrastructure patterns
- Keep environment-specific settings separate

---
