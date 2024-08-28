data "azurerm_subnet" "subnet" {
  for_each = var.vms
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_key_vault" "kv" {
  name = "vmkeyvaultrakesh"
  resource_group_name = "keysrg"
}

data "azurerm_key_vault_secret" "username" {
  key_vault_id = data.azurerm_key_vault.kv.id
  name = "vmusername"
}

data "azurerm_key_vault_secret" "password" {
  key_vault_id = data.azurerm_key_vault.kv.id
  name = "vmpassword"
}