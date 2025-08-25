#============== KINDLY RUN BELLOW COMMAND========== 
# $env:ARM_SUBSCRIPTION_ID = (az account show --query id -o tsv)

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "DoNotDeleteRg"
    storage_account_name = "donotdeletestorage555"
    container_name       = "tfstate"
    key                  = "GH-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3a45f28c-3b05-4d1b-b640-21585be45e39"
}


data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "githubAction" {
  name     = "Test-GithubA"
  location = "central india"
}
