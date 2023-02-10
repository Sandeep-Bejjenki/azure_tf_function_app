variable "environment" {
  type        = string
  description = "Environment of provisioned resource"
  default     = ""
}

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

variable "str_account_tier" {
  type        = string
  description = "Storage account tier"
  default     = ""
}

variable "sa_account_replication_type" {
  type        = string
  description = "Storage account replication type"
  default     = ""
}


variable "app_ser_plan_name" {
  type        = string
  description = "Name of App Service plan"
  default     = ""
}

variable "app_ser_pln_tier" {
  type        = string
  description = "App Service plan tier"
  default     = ""
}

variable "app_ser_pln_size" {
  type        = string
  description = "Size of App Service plan"
  default     = ""
}

variable "app_insights_name" {
  type        = string
  description = "Name of Application Insights"
  default     = ""
}

variable "appinsights_app_type" {
  type        = string
  description = "Type of Application Insights"
  default     = ""
}

variable "function_app_name" {
  type        = string
  description = "Name of Function App"
  default     = ""
}