module "resource_group" {
  source = "../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virual_network" {
  source   = "../modules/azurerm_virtual_network"
  vnets    = var.vnets
  rg_names = module.resource_group.rg_names
}

module "subnet" {
  source     = "../modules/azurerm_subnet"
  subnets    = var.subnets
  rg_names   = module.resource_group.rg_names
  vnet_names = module.virual_network.vnet_names

}

module "public_ip" {
  source   = "../modules/azurerm_public_ip"
  pips     = var.pips
  rg_names = module.resource_group.rg_names
}

module "network-interface" {
  source    = "../modules/azurerm_network_interface"
  nics      = var.nics
  rg_names  = module.resource_group.rg_names
  subnet_id = module.subnet.subnet_id
  pip_id    = module.public_ip.pip_id
  nsg_id    = module.network_security.nsg_id
}

module "keyvault" {
  source    = "../modules/azurerm_key_vault"
  keyvaults = var.keyvaults
  secrets   = var.secrets
  rg_names  = module.resource_group.rg_names
}

module "virtual_machine" {
  source        = "../modules/azurerm_virtual_machine"
  vms           = var.vms
  rg_names      = module.resource_group.rg_names
  nic_id        = module.network-interface.nic_id
  secret_values = module.keyvault.secret_values
}

module "network_security" {
  source   = "../modules/azurerm_network_security_group"
  nsg      = var.nsg
  rg_names = module.resource_group.rg_names
}