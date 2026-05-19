terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tofu-state"
    storage_account_name = "sttofustateinternal01"
    container_name       = "tfstate"
    key                  = "internal-it/dev.terraform.tfstate"
  }
}
