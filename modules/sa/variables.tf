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

