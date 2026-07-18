resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_storage_account" "storage" {

  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  is_hns_enabled = true

  tags = {
    Environment = "Development"
    Project     = "Financial Analytics"
  }

}
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
    Project     = "Financial Analytics"
  }
}