resource "azurerm_network_interface" "nic" {
  for_each = var.vms
  name = each.value.nic_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name="internal"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vms" {
  depends_on = [ azurerm_network_interface.nic ]
  for_each = var.vms
  name = each.value.vm_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  admin_password = data.azurerm_key_vault_secret.password[each.key].value
  admin_username = data.azurerm_key_vault_secret.username[each.key].value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  size = "Standard_F2"
  os_disk {
    caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }
