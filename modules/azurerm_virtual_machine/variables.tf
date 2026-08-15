variable "vms" {
  type = map(object({
    vm_name              = string
    resource_group_name  = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = optional(string)
    secret_key           = optional(string)
    nic_id               = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
  }))
}

variable "rg_names" {
  type = map(string)
}

variable "nic_id" {
  type = map(string)
}

variable "secret_values" {
  type    = map(string)
  default = {}
}

