output "pip_id" {
    value = {
        for key, value in azurerm_public_ip.pip:
        key => value.id
    } 
}

output "public_ip_addresses" {
  value = {
    for k, v in azurerm_public_ip.pip : k => v.ip_address
  }
}