variable "application_insights_name" {
  description = "Name of the Application Insights instance."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where Application Insights will be created."
  type        = string
}

variable "location" {
  description = "Azure region for Application Insights."
  type        = string
}

variable "application_type" {
  description = "Type of application being monitored."
  type        = string
  default     = "web"
}

variable "tags" {
  description = "Tags to apply to Application Insights."
  type        = map(string)
  default     = {}
}