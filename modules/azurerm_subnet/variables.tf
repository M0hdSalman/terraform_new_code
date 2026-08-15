variable "subnets" {
    type = map(object({
      name = string
      resource_group_name = string
      virtual_network_name = string
      address_prefixes = list(string)
    }))
}

variable "rg_names" {
    type = map(string)
}

variable "vnet_names" {
    type = map(string)
}