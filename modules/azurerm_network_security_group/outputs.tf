output "nsg_id" {
  value = {
    for k, v in azurerm_network_security_group.example : k => v.id
  }
}