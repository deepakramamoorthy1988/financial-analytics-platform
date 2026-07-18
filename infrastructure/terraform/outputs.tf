output "resource_group_name" {
  description = "Azure Resource Group Name"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Azure Storage Account Name"
  value       = azurerm_storage_account.storage.name
}

output "data_factory_name" {
  description = "Azure Data Factory Name"
  value       = azurerm_data_factory.adf.name
}

output "key_vault_name" {
  description = "Azure Key Vault Name"
  value       = azurerm_key_vault.kv.name
}