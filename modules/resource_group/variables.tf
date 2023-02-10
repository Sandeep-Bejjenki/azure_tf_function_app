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