resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.appinsights_app_type
  tags = var.tags
}

resource "azurerm_function_app" "fun_app" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_ser_plan_id
  storage_account_name       = var.str_account_name
  storage_account_access_key = var.storage_account_access_key
  site_config {
    dotnet_framework_version = "v6.0"
  }
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights.instrumentation_key
  }
  tags = var.tags
}