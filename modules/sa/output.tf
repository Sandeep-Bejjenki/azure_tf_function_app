output "str_acct_id" {
  description = "ID of storage account provisioned"
  value       = azurerm_storage_account.str_account.id
}

output "str_acct_name" {
  description = "description"
  value       = azurerm_storage_account.str_account.name
}

output "str_acct_access_key" {
  description = "description"
  value       = azurerm_storage_account.str_account.primary_access_key
  sensitive = true
}