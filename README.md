# Terraform Homelab

This repo is part of my ongoing effort to learn Terraform and improve my infrastructure-as-code practices in my homelab. The goal is to build clean, repeatable, and scalable infrastructure while exploring best practices along the way.

## Project Structure

```
repos/terraform/
├── proxmox-docker-nodes/     # Current project - deploy Docker nodes
│   ├── main.tf
│   ├── vars.tf
│   ├── terraform.tfvars
├── proxmox-k8s-cluster/      # Future Kubernetes cluster
│   ├── main.tf
│   ├── vars.tf
│   └── terraform.tfvars
├── proxmox-monitoring/       # Monitoring infrastructure (Prometheus, Grafana, etc.)
│   ├── main.tf
│   ├── vars.tf
│   └── terraform.tfvars
└── modules/                  # Shared and reusable modules
    ├── proxmox-vm/
    └── common-configs/
```

## Getting Started (Runbook)

From inside a project directory (e.g. `proxmox-docker-nodes/`):

### 1. Initialize Terraform

```bash
terraform init
```

_Prepares the working directory by downloading providers and initializing the backend._

---

### 2. Preview Changes

```bash
terraform plan -out=tfplan
```

_Shows what Terraform will do, and saves the plan to a file._

---

### 3. Apply the Plan

```bash
terraform apply tfplan
```

_Applies the previously saved plan to create/update infrastructure._

---

### 4. Destroy Resources (when cleaning up)

```bash
terraform destroy
```

_Destroys all managed infrastructure._

---

### 5. Clean Up

```bash
rm -f tfplan
```

_Removes the saved plan file after apply._

---

## Notes

* Variable values go in `terraform.tfvars`
* `vars.tf` defines input variables
* `main.tf` holds the core configuration

---

## Optional Tools

While not required yet, I may later integrate:

* **Pre-commit hooks**
* **YAML/Terraform linting**
* **State file backend (e.g. S3, Consul)** once workflows are more complex
