resource "azurerm_storage_account" "str_account" {
  name                     = var.str_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.str_account_tier
  account_replication_type = var.sa_account_replication_type
  tags = var.tags
}