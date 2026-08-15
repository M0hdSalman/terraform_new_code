resource "azurerm_network_interface" "nic" {
    for_each = var.nics
    name                = each.value.name
    location            = each.value.location
    resource_group_name = var.rg_names[each.value.resource_group_name]

  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = var.subnet_id[each.value.subnet_id]
    public_ip_address_id = var.pip_id[each.value.public_ip_address_id]
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  for_each = var.nics

  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = var.nsg_id[each.value.nsg_name]
}
