variable "nsg" {
  type = map(object({
    nsg_name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "rg_names" {
  type = map(string)
}
