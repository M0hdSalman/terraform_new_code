variable "keyvaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    sku_name                    = optional(string, "standard")
    enabled_for_disk_encryption = optional(bool, true)
    soft_delete_retention_days  = optional(number, 7)
    purge_protection_enabled    = optional(bool, false)
  }))
}

variable "secrets" {
  type = map(object({
    name          = string
    key_vault_key = string
    value         = optional(string)
    length        = optional(number, 16)
  }))
}

variable "rg_names" {
  type = map(string)
}
