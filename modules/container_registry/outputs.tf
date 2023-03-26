output "id" {
  value = azurerm_container_registry.acr.id
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "admin_password" {
  sensitive = true
  value     = azurerm_container_registry.acr.admin_password
}

# output "identity_principal_id" {
#   value = azurerm_container_registry.acr.identity.0.principal_id
# }

# output "identity_tenant_id" {
#   value = azurerm_container_registry.acr.identity.0.tenant_id
# }