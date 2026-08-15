terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "statefile-rg"
    storage_account_name = "statefilekliyerg"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}