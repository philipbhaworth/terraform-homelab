output "vm_ids" {
  description = "The IDs of the created VMs"
  value       = module.docker_nodes.vm_ids
}

output "vm_names" {
  description = "The names of the created VMs"
  value       = module.docker_nodes.vm_names
}
