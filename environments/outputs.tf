output "vm_public_ips" {
  value = module.public_ip.public_ip_addresses
}

output "vm_admin_usernames" {
  value = module.virtual_machine.admin_usernames
}

output "key_vault_ids" {
  value = module.keyvault.key_vault_ids
}