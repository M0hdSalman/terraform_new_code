output "rg_names" {
    value = {
        for key, value in azurerm_resource_group.rg:
        key => value.name
    } 
}

