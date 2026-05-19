variable "location" {
  description = "Azure region for the internal environment."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the internal environment."
  type        = string
}

variable "tags" {
  description = "Common tags for all resources in this environment."
  type        = map(string)
  default     = {}
}

variable "storage_account_name" {
  description = "Storage account name for the application."
  type        = string
}
variable "application_insights_name" {
  description = "Name of the Application Insights instance."
  type        = string
}
variable "function_app_name" {
  description = "Name of the Azure Function App."
  type        = string
}

variable "service_plan_name" {
  description = "Name of the Flex Consumption service plan."
  type        = string
}

variable "storage_container_name" {
  description = "Name of the blob container used for Function deployment storage."
  type        = string
  default     = "functionapp-package"
}