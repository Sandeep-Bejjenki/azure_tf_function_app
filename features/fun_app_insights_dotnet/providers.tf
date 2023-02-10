terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-eastus"
    storage_account_name = "tfstatergtest"
    container_name       = "tfstate"
    key                  = "dev.functionapp.insights.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "24b6ed27-e868-457e-95b0-a935f0dd01cf"
  client_id       = "82ea2464-2cbb-4e25-a1fa-a3768bd16ce0"
  client_secret   = "6pz8Q~muQh1y7hrxFQJR1Z5X5FRxD0etaj2PVcoE"
  tenant_id       = "5355d49d-2756-4ee4-81ba-1ec5bacf2f40"
  features {
    resource_group { prevent_deletion_if_contains_resources = false  }
  }
}