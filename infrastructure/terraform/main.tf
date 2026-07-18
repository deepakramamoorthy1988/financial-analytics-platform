data "azurerm_client_config" "current" {}
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

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  rbac_authorization_enabled = true

  tags = {
    Environment = "Development"
    Project     = "Financial Analytics"
  }
}

resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  os_type  = "Linux"
  sku_name = "B1"

  tags = {
    Environment = "Development"
    Project     = "Financial Analytics"
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  https_only = true

  site_config {
    always_on = true

    application_stack {
      python_version = "3.11"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
    Project     = "Financial Analytics"
  }
}