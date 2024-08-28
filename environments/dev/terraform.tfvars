childrg_details={
    rg1={
        name="devrg"
        location="centralindia"
    }
}

childvnet_details = {
  vnet1={
    name="dev-vnet"
    location="centralindia"
    resource_group_name="devrg"
  }
}

childsubnet_details = {
  subnet1={
    name="Frontendsubnet"
    resource_group_name="devrg"
    virtual_network_name="dev-vnet"
    address_prefixes=["10.0.1.0/24"]
 }
   subnet2={
    name="Backendsubnet"
    resource_group_name="devrg"
    virtual_network_name="dev-vnet"
    address_prefixes=["10.0.2.0/24"]
 }
}

vms_details = {
  vm1={
    subnet_name="Frontendsubnet"
    resource_group_name="devrg"
    virtual_network_name="dev-vnet"
    nic_name="vm-nic1"
    location="centralindia"
    vm_name="Frontendvm"
  }
    vm2={
    subnet_name="Backendsubnet"
    resource_group_name="devrg"
    virtual_network_name="dev-vnet"
    nic_name="vm-nic2"
    location="centralindia"
    vm_name="Backendvm"    
  }
}
