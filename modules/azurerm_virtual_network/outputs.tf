output "vnet_names" {
    value = {
        for key, value in azurerm_virtual_network.vnet:
        key => value.name
    } 
}