# azure_tf_function_app

## Requirements

### Provides
Azure Provider     Version - 3.43.0
Terraform Provider Version - 0.13

providers.tf file all required configuration for Terraform and AzureRM is declared.

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

### Modules
Modules are have been is custom modules which is developed for this requirement available in modules folder.

1. app_service_plan
2. functionapp_insights
3. resource_group
4. sa

### Featues
Features are actual resources deployed using modules and client can provide their inputs for terraform for deployment of resources according to their requirement.

```hcl

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
```
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment of provisioned resource | `string` | `""` | no |
| tags | Labels for resources | `map(any)` | `""` | no |
| resource\_group\_name | Application region name | `string` | `""` | yes |
| location | Location of resource group | `string` | `""` | yes |
| str\_account\_name | Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only. | `string` | `""` | yes |
| str_account\_tier | Storage account tier | `string` | `""` | yes |
| sa\_account\_replication\_type | Storage account replication type | `string` | `""` | yes |
| app\_ser\_plan\_name | Name of App Service plan | `string` | `""` | yes |
| app\_ser\_pln\_tier | App Service plan tier | `string` | `""` | yes |
| app\_ser\_pln\_size | Size of App Service plan | `string` | `""` | yes |
| app\_insights\_name | Name of Application Insights | `string` | `""` | yes |
| appinsights\_app\_type | Type of Application Insights | `string` | `""` | yes |
| function\_app\_name | Name of Function App | `string` | `""` | yes |

### Outputs

| Name | Description |
|------|-------------|
| app\_service\_plan\_id | App service plan ID |
| function\_app\_site\_credential | A site_credential block as defined below, which contains the site-level credentials used to publish to this App Service. |
| insights\_id | The ID of the Application Insights component. |
| storage\_account\_id | ID of storage account provisioned |