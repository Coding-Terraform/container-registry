terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-states"
    storage_account_name = "saterraformbackendstates"
    container_name       = "terraformstates"
    key                  = "acr-encryption/tfstate"
    use_msi              = true
    subscription_id      = "f64d003b-4449-4899-81e2-0bf114282ef6"
    tenant_id            = "13b94438-e31c-4b23-81a1-cfeb39466cb9"
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
