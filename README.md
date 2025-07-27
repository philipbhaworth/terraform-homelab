# Terraform Homelab Infrastructure

This repository contains Terraform configurations for managing Proxmox VE virtual machines in a homelab environment.

## Directory Structure

```
terraform-homelab/
├── README.md                      # This file
├── .gitignore                     # Git ignore patterns
├── modules/
│   ├── README.md                  # Module documentation
│   └── vm_from_iso/               # Reusable VM creation module
│       ├── README.md              # Module-specific documentation
│       ├── main.tf                # VM resource definitions
│       ├── variables.tf           # Input parameters
│       └── outputs.tf             # Return values
└── environments/
    ├── README.md                  # Environment documentation
    ├── basic-vm/                  # Standard VM deployment
    │   ├── README.md              # Deployment instructions
    │   ├── main.tf                # Environment configuration
    │   ├── variables.tf           # Environment variables
    │   ├── terraform.tfvars.example # Example configuration
    │   └── terraform.tfvars       # Your actual values (ignored by git)
    └── future-environments/       # Additional deployments
```

## Getting Started

### Prerequisites
- Terraform >= 1.0.0
- Proxmox VE cluster
- API token with appropriate permissions
- ISO files uploaded to Proxmox storage

### Quick Start
1. Clone this repository
2. Navigate to an environment: `cd environments/basic-vm/`
3. Copy example config: `cp terraform.tfvars.example terraform.tfvars`
4. Edit `terraform.tfvars` with your values
5. Initialize: `terraform init`
6. Plan: `terraform plan`
7. Apply: `terraform apply`

## Environments

Each environment is a specific deployment using the shared modules:

- **basic-vm/** - Standard VM deployment template
- **Future environments** - Add more as needed

## Support

For issues or questions, check the environment-specific README files or module documentation.

---
