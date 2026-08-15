output "admin_usernames" {
  value = {
    for k, v in azurerm_linux_virtual_machine.vm : k => v.admin_username
  }
}