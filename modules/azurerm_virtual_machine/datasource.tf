data "azurerm_subnet" "subnet" {
  for_each = var.vms
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_key_vault" "kv" {
  for_each = var.vms
  name = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.vms
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
  name = each.value.kv_username
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.vms
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
  name = each.value.kv_password
}