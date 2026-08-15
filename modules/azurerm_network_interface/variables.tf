variable "nics" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    ip_config_name                = string
    subnet_id                     = string
    public_ip_address_id          = string
    private_ip_address_allocation = string
    nsg_name                      = string
  }))
}

variable "rg_names" {
  type = map(string)
}

variable "subnet_id" {
  type = map(string)
}

variable "pip_id" {
  type = map(string)
}

variable "nsg_id" {
  type = map(string)
}