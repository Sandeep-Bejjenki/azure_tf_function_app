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

variable "service_plan_name" {
  type        = string
  description = "Name of App service plan"
  default     = ""
}


variable "app_ser_pln_tier" {
  type        = string
  description = "App service plan tier"
  default     = ""
}

variable "app_ser_pln_size" {
  type        = string
  description = "App service plan size"
  default     = ""
}
