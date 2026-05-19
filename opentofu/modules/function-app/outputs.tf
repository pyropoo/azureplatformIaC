output "id" {
  description = "The ID of the Function App."
  value       = azurerm_function_app_flex_consumption.this.id
}

output "name" {
  description = "The name of the Function App."
  value       = azurerm_function_app_flex_consumption.this.name
}

output "default_hostname" {
  description = "The default hostname of the Function App."
  value       = azurerm_function_app_flex_consumption.this.default_hostname
}

output "principal_id" {
  description = "The principal ID of the system-assigned managed identity."
  value       = azurerm_function_app_flex_consumption.this.identity[0].principal_id
}

output "service_plan_id" {
  description = "The ID of the Flex Consumption service plan."
  value       = azurerm_service_plan.this.id
}

output "storage_container_name" {
  description = "The blob container name used by the Function App."
  value       = azurerm_storage_container.deployment.name
}