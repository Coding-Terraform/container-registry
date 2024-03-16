terraform {
  backend "azurerm" {
    resource_group_name  = "rg-bck-env1-mlt-euw"
    storage_account_name = "tfstatemlt"
    container_name       = "tfstatecontainer"
    key                  = "acr-encryption/tfstate"
    use_msi              = true
    subscription_id      = "17e5a339-c9a2-4e19-9f00-e077071e8443"
    tenant_id            = "505cca53-5750-4134-9501-8d52d5df3cd1"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.44"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=3.0.2"
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
