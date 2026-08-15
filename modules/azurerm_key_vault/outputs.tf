output "secret_values" {
  value = {
    for k, v in azurerm_key_vault_secret.secret : k => v.value
  }
  sensitive = true
}

output "key_vault_ids" {
  value = {
    for k, v in azurerm_key_vault.kv : k => v.id
  }
}
