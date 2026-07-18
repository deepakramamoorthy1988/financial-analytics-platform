variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "storage_account_name" {
  description = "Azure Storage Account Name"
  type        = string
}

variable "account_tier" {
  description = "Storage Tier"
  type        = string
}

variable "replication_type" {
  description = "Replication"
  type        = string
}

variable "data_factory_name" {
  description = "Azure Data Factory Name"
  type        = string
}