terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.15.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "reto1-rg-rbits" {
  name     = "${var.project}-${var.environment}-resource-group"
  location = var.location

  tags = {
    CREATEDBY = "${var.owner}"
    DPT       = "${var.owner}"
    AMBIENTE  = "${var.owner}"
  }
}