variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku" {
  type        = string
  description = "(Required) The SKU name of the container registry. Possible values are Basic, Standard and Premium."
}

variable "admin_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for the container registry. Defaults to true."
}
