# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name

  # Create Tag
  tags = {
    Enviroment = "Terraform Azure Getting Started"
    Team       = "devops"
  }

}

# Create a subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create network interface
resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create your virtual machine
resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = var.azurerm_resource_group_location
  resource_group_name   = var.azurerm_resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # this line will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # this line will delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  # You may replace login and password with ssh keys. If not this info will be stored in plain text so change the password immediatley. 
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}