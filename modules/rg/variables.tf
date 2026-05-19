variable "name" {
  description = "Name of the Azure Resource Group."
  type        = string

  validation {
    condition     = length(var.name) > 1
    error_message = "Resource group name must be longer than 1 character."
  }
}

variable "location" {
  description = "Azure region where the resource group will be created."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource group."
  type        = map(string)
  default     = {}
}