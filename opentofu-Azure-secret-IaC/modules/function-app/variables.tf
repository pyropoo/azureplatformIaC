variable "function_app_name" {
  description = "Name of the Azure Function App."
  type        = string
}

variable "service_plan_name" {
  description = "Name of the Azure Service Plan used for Flex Consumption."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the Function App will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the Function App."
  type        = string
}

variable "storage_account_id" {
  description = "ID of the storage account used by the Function App."
  type        = string
}

variable "storage_blob_endpoint" {
  description = "Primary blob endpoint of the storage account."
  type        = string
}

variable "storage_account_access_key" {
  description = "Primary access key of the storage account."
  type        = string
  sensitive   = true
}

variable "storage_container_name" {
  description = "Name of the private blob container used for Flex Function deployment storage."
  type        = string
  default     = "functionapp-package"
}

variable "application_insights_connection_string" {
  description = "Application Insights connection string."
  type        = string
  sensitive   = true
}

variable "runtime_name" {
  description = "Runtime name for the Flex Function App."
  type        = string
  default     = "python"
}

variable "runtime_version" {
  description = "Runtime version for the Flex Function App."
  type        = string
  default     = "3.11"
}

variable "maximum_instance_count" {
  description = "Maximum number of instances for the Flex Consumption Function App."
  type        = number
  default     = 50
}

variable "instance_memory_in_mb" {
  description = "Memory size in MB for each Flex Consumption instance."
  type        = number
  default     = 2048
}

variable "app_settings" {
  description = "Extra application settings to apply to the Function App."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}