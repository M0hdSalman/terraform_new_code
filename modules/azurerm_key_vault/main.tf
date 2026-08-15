data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each                    = var.keyvaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = var.rg_names[each.value.resource_group_name]
  enabled_for_disk_encryption = lookup(each.value, "enabled_for_disk_encryption", true)
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 7)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", false)
  sku_name                    = lookup(each.value, "sku_name", "standard")

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Delete"
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover"
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
}

resource "random_password" "secret_password" {
  for_each         = { for k, v in var.secrets : k => v if lookup(v, "value", null) == null }
  length           = lookup(each.value, "length", 16)
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.secrets
  name         = each.value.name
  value        = lookup(each.value, "value", try(random_password.secret_password[each.key].result, null))
  key_vault_id = azurerm_key_vault.kv[each.value.key_vault_key].id
}
