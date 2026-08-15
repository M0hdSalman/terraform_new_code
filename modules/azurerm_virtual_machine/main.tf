resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = var.rg_names[each.value.resource_group_name]
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = try(var.secret_values[each.value.secret_key], each.value.admin_password)
  disable_password_authentication = false
  network_interface_ids           = [var.nic_id[each.value.nic_id]]

  custom_data = base64encode(file("${path.module}/cloud-init.yaml"))

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
