module "rgs" {
  source = "../../modules/azurerm_resource_group"
  rgs_details = var.childrg_details
}

module "vnet" {
  depends_on = [ module.rgs ]
  source = "../../modules/azurerm_virtual_network"
  vnet_details = var.childvnet_details
}

module "subnet" {
   depends_on = [ module.vnet ]
  source = "../../modules/azurerm_subnet"
  subnet_details = var.childsubnet_details
}

module "vm" {
  depends_on = [ module.subnet ]
  source = "../../modules/azurerm_virtual_machine"
  vms=var.vms_details
}
