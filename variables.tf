variable "rg_name" {
  type        = string
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}

############ Container Registry  ############

variable "acr_name" {
  type = string
}

variable "public_network_access_enabled" {
  type = string
}

variable "admin_enabled" {
  type = bool
}

variable "acr_sku" {
  type = string
}
