variable "azurerm_subnet_name" {
  type    = string
  default = "Internal-subnet-001"

  validation {
    condition     = length(var.azurerm_subnet_name) > 4
    error_message = "Instance names must be of a length greater than 4."
  }
}

variable "prefix" {
  default = "tfvmex-"
}

variable "azurerm_resource_group_name" {
  default = "1-46e5c2b2-playground-sandbox"
}

variable "azurerm_resource_group_location" {
  default = "Central US"
}