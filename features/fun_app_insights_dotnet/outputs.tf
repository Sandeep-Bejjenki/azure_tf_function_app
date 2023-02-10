output "app_service_plan_id" {
  description = "App service plan ID"
  value       = module.app_service_plan.app_ser_plan_id
}

output "function_app_site_credential" {
  description = "A site_credential block as defined below, which contains the site-level credentials used to publish to this App Service."
  value       = module.function_app_insights.fun_app_site_credential
}

output "insights_id" {
  description = "The ID of the Application Insights component."
  value       = module.function_app_insights.insights_id
}

output "storage_account_id" {
  description = "ID of storage account provisioned"
  value       = module.storage_account.str_acct_id
}