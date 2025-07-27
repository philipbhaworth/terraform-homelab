# Terraform Environments

This directory contains specific deployments that use the shared modules.

## Environment Structure

Each environment follows a standard structure:
```
environment-name/
├── README.md              # Deployment-specific documentation
├── main.tf                # Environment configuration
├── variables.tf           # Environment variables
├── terraform.tfvars.example # Example configuration
└── terraform.tfvars       # Your actual values (ignored by git)
```

## Available Environments

### basic-vm
Standard VM deployment template. Use this as a starting point for any basic VM needs:
- Single or multiple VMs
- Configurable hardware specs
- ISO-based installation
- Perfect for development, testing, or general purpose VMs

## Creating New Environments

1. Copy an existing environment directory
2. Modify the configuration for your needs
3. Update the README.md with environment-specific information
4. Configure terraform.tfvars with your values

## Standard Workflow

All environments follow the same deployment pattern:
```bash
cd environments/your-environment/
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars
terraform init
terraform plan
terraform apply
```

---
