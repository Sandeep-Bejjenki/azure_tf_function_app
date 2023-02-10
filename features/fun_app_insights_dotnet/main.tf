module "resource_grp" {
  source              = "../../modules/resource_group"
  resource_group_name = "${var.environment}-${var.resource_group_name}-${var.location}-rg"
  location            = var.location
  tags                = var.tags
}

module "storage_account" {
  source                      = "../../modules/sa"
  resource_group_name         = module.resource_grp.resource_grp_name
  location                    = var.location
  str_account_name            = "${var.environment}${var.str_account_name}${var.location}"
  str_account_tier            = var.str_account_tier
  sa_account_replication_type = var.sa_account_replication_type
  tags                        = var.tags
  depends_on = [
    module.resource_grp
  ]
}

module "app_service_plan" {
  source              = "../../modules/app_service_plan"
  resource_group_name = module.resource_grp.resource_grp_name
  location            = var.location
  service_plan_name   = "${var.environment}-${var.resource_group_name}-${var.app_ser_plan_name}"
  app_ser_pln_tier    = var.app_ser_pln_tier
  app_ser_pln_size    = var.app_ser_pln_size
  tags                = var.tags
  depends_on = [
    module.resource_grp
  ]
}

module "function_app_insights" {
  source                     = "../../modules/functionapp_insights"
  resource_group_name        = module.resource_grp.resource_grp_name
  location                   = var.location
  app_insights_name          = "${var.environment}-${var.resource_group_name}-${var.app_insights_name}"
  appinsights_app_type       = var.appinsights_app_type
  function_app_name          = "${var.environment}-${var.resource_group_name}-${var.function_app_name}"
  str_account_name           = module.storage_account.str_acct_name
  app_ser_plan_id            = module.app_service_plan.app_ser_plan_id
  storage_account_access_key = module.storage_account.str_acct_access_key
  tags                       = var.tags
  depends_on = [
    module.resource_grp,
    module.storage_account,
    module.app_service_plan
  ]
}