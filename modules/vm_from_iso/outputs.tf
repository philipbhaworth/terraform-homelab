output "vm_ids" {
  description = "The IDs of the created VMs"
  value       = [for vm in proxmox_virtual_environment_vm.vm_from_iso : vm.vm_id]
}

output "vm_names" {
  description = "The names of the created VMs"
  value       = [for vm in proxmox_virtual_environment_vm.vm_from_iso : vm.name]
}
