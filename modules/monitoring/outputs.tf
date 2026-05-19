output "id" {
  description = "The ID of the Application Insights instance."
  value       = azurerm_application_insights.this.id
}

output "name" {
  description = "The name of the Application Insights instance."
  value       = azurerm_application_insights.this.name
}

output "connection_string" {
  description = "The Application Insights connection string."
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
}

output "instrumentation_key" {
  description = "The Application Insights instrumentation key."
  value       = azurerm_application_insights.this.instrumentation_key
  sensitive   = true
}