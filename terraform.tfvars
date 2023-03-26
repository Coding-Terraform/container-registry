rg_name  = "rg-acr-test"
location = "westeurope"
tags = {
  "project"     = "arc-test"
  "environment" = "dev"
}

############# Conatiner Registry  #############
acr_name                      = "acrdevtest"
public_network_access_enabled = false
admin_enabled                 = false
acr_sku                       = "Premium"
