rgs = {
  rg1 = {
    name     = "dev-rg1"
    location = "japaneast"
  }

  rg2 = {
    name     = "dev-rg2"
    location = "japaneast"
  }

}

vnets = {
  vnet1 = {
    name                = "dev-vnet1"
    location            = "japaneast"
    resource_group_name = "rg1"
    address_space       = ["10.1.0.0/16"]
  }

  vnet2 = {
    name                = "dev-vnet2"
    location            = "japaneast"
    resource_group_name = "rg1"
    address_space       = ["10.2.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.1.1.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "frontend-nic-pip"
    location            = "japaneast"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "backend-nic-pip"
    location            = "japaneast"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }
}

nics = {
  nic1 = {
    name                          = "frontend-vm-nic"
    location                      = "japaneast"
    resource_group_name           = "rg1"
    ip_config_name                = "internal"
    subnet_id                     = "subnet1"
    public_ip_address_id          = "pip1"
    private_ip_address_allocation = "Dynamic"
    nsg_name                      = "nsg1"
  }

  nic2 = {
    name                          = "backend-vm-nic"
    location                      = "japaneast"
    resource_group_name           = "rg1"
    ip_config_name                = "internal"
    subnet_id                     = "subnet2"
    public_ip_address_id          = "pip2"
    private_ip_address_allocation = "Dynamic"
    nsg_name                      = "nsg2"
  }
}

vms = {
  vm1 = {
    vm_name              = "frontend-vm"
    resource_group_name  = "rg1"
    location             = "japaneast"
    size                 = "Standard_B2als_v2"
    admin_username       = "azureuser"
    secret_key           = "secret1"
    nic_id               = "nic1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }

  vm2 = {
    vm_name              = "backend-vm"
    resource_group_name  = "rg1"
    location             = "japaneast"
    size                 = "Standard_B2als_v2"
    admin_username       = "azureuser"
    secret_key           = "secret2"
    nic_id               = "nic2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
}

nsg = {
  nsg1 = {
    nsg_name            = "nsg1"
    location            = "japaneast"
    resource_group_name = "rg1"
  }

  nsg2 = {
    nsg_name            = "nsg2"
    location            = "japaneast"
    resource_group_name = "rg1"
  }
}

keyvaults = {
  kv1 = {
    name                = "dev-kv-salman123"
    location            = "japaneast"
    resource_group_name = "rg1"
    sku_name            = "standard"
  }
}

secrets = {
  secret1 = {
    name          = "frontend-vm-admin-password"
    key_vault_key = "kv1"
  }

  secret2 = {
    name          = "backend-vm-admin-password"
    key_vault_key = "kv1"
  }
}

