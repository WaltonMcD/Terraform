output "azurerm_virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "azurerm_subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "azurerm_vm_public_ip" {
  value = azurerm_network_interface.main.ip_configuration
}