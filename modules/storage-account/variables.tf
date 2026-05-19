variable "name" {
  description = "Name of the Azure Storage Account."
  type        = string

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 24
    error_message = "Storage account name must be between 3 and 24 characters."
  }

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.name))
    error_message = "Storage account name must contain only lowercase letters and numbers."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the storage account."
  type        = string
}

variable "account_tier" {
  description = "Storage account tier."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type."
  type        = string
  default     = "LRS"
}

variable "min_tls_version" {
  description = "Minimum TLS version allowed for the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default     = {}
}