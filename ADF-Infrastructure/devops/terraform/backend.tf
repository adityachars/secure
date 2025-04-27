terraform {
  backend "azurerm" {
  }

  required_providers {
    azure = {
      source  = "azurerm"
      version = "2.97.0"
    }
    pgp = {
      source = "ekristen/pgp"
      version = "0.2.4"
    }
    azapi = {
      source = "azure/azapi"
    }
  }
}

# Providers
provider "azure" {
  skip_provider_registration = true
  features {}
}
