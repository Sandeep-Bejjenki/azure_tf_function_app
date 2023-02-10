resource "azurerm_app_service_plan" "appsrvpln" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.app_ser_pln_tier
    size = var.app_ser_pln_size
  }

  tags = var.tags
}