terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformVsBicep"
    storage_account_name = "terraformbackendstorge"
    container_name       = "terraformstate"
    key                  = "tf.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.44"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.16.0"
    }
  }
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = true
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"

   registry_auth {
    address  = module.acr.login_server
    username = module.acr.admin_username
    password = module.acr.admin_password
  }
}