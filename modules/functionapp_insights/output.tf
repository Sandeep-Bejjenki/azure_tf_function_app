output "function_app_id" {
  description = "The ID of the Function App"
  value       = azurerm_function_app.fun_app.id
}

output "fun_app_site_credential" {
  description = "A site_credential block as defined below, which contains the site-level credentials used to publish to this App Service."
  value       = azurerm_function_app.fun_app.site_credential
}

output "insights_id" {
  description = "The ID of the Application Insights component."
  value       = azurerm_application_insights.app_insights.id
}

output "instrumentation_key" {
  description = "The Instrumentation Key for this Application Insights component."
  value       = azurerm_application_insights.app_insights.instrumentation_key
  sensitive   = true
}



