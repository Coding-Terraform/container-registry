rg_name  = "rg-acr-test"
location = "westeurope"
tags = {
  "project"     = "arc-test"
  "environment" = "dev"
}

############# Conatiner Registry  #############

acr_name                      = "acrmltdtest"
public_network_access_enabled = true
admin_enabled                 = true
acr_sku                       = "Premium"
