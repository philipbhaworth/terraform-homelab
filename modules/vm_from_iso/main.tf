terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.46.4"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm_from_iso" {
  count       = var.enabled ? var.vm_count : 0
  name        = "${var.vm_name_prefix}-${count.index + 1}"
  node_name   = var.target_node
  vm_id       = var.vmid_start + count.index
  description = var.description != "" ? var.description : "Managed by Terraform - Created from ISO"

  stop_on_destroy = true
  machine         = var.machine_type

  cdrom {
    enabled = true
    file_id = var.iso_file
  }

  cpu {
    cores   = var.cpu_cores
    sockets = var.cpu_sockets
    type    = var.cpu_type
  }

  memory {
    dedicated = var.memory
  }

  agent {
    enabled = var.agent_enabled
    timeout = "2m"
    type    = "virtio"
  }

  boot_order = ["ide0"]
  on_boot    = true

  network_device {
    bridge   = var.network_bridge
    model    = "virtio"
    firewall = var.enable_firewall
  }

  disk {
    datastore_id = var.storage
    interface    = "scsi0"
    iothread     = false
    size         = var.disk_size
    discard      = "on"
    ssd          = var.disk_ssd
    file_format  = "raw"
  }

  dynamic "disk" {
    for_each = var.additional_disk_size > 0 ? [1] : []
    content {
      datastore_id = var.storage
      interface    = "scsi1"
      iothread     = false
      size         = var.additional_disk_size
      discard      = "on"
      ssd          = var.disk_ssd
      file_format  = "raw"
    }
  }

  serial_device {
    device = "socket"
  }

  operating_system {
    type = "l26" # Linux 2.6+ kernel
  }

  started = var.vm_autostart
  tags    = var.tags != null && var.tags != "" ? split(",", var.tags) : null

  lifecycle {
    ignore_changes = [
      agent,
    ]
  }
}
