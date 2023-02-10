variable "tags" {
  type        = map(any)
  description = "Labels for resources"
  default = {
    created_by  = ""
    cost_center = ""
    owner       = ""
    environment = ""
  }
}

variable "resource_group_name" {
  type        = string
  description = "Application region name"
  default     = ""
}

variable "location" {
  type        = string
  description = "Location of resource group"
  default     = ""
}

variable "str_account_name" {
  type        = string
  description = "Function app strorage account name"
  default     = ""
  validation {
    condition     = length(var.str_account_name) > 2 && length(var.str_account_name) < 25 && can(regex("[a-z.*]|[0-9]", var.str_account_name))
    error_message = "Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only."
  }
}

variable "app_insights_name" {
  type        = string
  description = "Name of application insights"
  default     = ""
}

variable "appinsights_app_type" {
  type        = string
  description = "Application insights application type"
  default     = "web"
}

variable "function_app_name" {
  type        = string
  description = "Name of function app"
  default     = ""
}

variable "app_ser_plan_id" {
  type        = string
  description = "app service plan ID"
  default     = ""
}

variable "storage_account_access_key" {
  type        = string
  description = "storage_account_primary_access_key"
  default     = ""
}

