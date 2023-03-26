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

################################################

# variable "docker_registry_url" {
#   description = "Address of ACR container registry."
#   type        = string
# }

# variable "docker_registry_username" {
#   description = "Username for authenticating with the container registry. Required if docker_config_file_path is not set."
#   type        = string
#   default     = ""
# }

# variable "docker_registry_password" {
#   description = "Password for authenticating with the container registry. Required if docker_config_file_path is not set."
#   type        = string
#   default     = ""
#   sensitive   = true
# }

# variable "docker_config_file_path" {
#   description = "Path to config.json containing docker configuration."
#   type        = string
#   default     = ""
# }

# variable "docker_image_name" {
#   description = "Name of docker image to build."
#   type        = string
# }

# variable "docker_image_tag" {
#   description = "Tag to use for the docker image."
#   type        = string
#   default     = "latest"
# }

# variable "source_path" {
#   description = "Path to folder containing application code"
#   type        = string
#   default     = null
# }

# variable "docker_file_path" {
#   description = "Path to Dockerfile in source package"
#   type        = string
# }

# variable "build_args" {
#   description = "A map of Docker build arguments."
#   type        = map(string)
#   default     = {}
# }

variable "keep_remotely" {
  description = "Whether to keep Docker image in the remote registry on destroy operation."
  type        = bool
  default     = false
}