module "resource_group" {
  source = "../../modules/rg"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "storage_account" {
  source = "../../modules/storage-account"

  name                = var.storage_account_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  tags                = var.tags
}

module "storage_alerts" {
  source = "../../modules/storage-alerts"

  resource_group_name           = module.resource_group.name
  storage_account_id            = module.storage_account.id
  action_group_name             = "ag-secret-expiry-internal-sc-01"
  action_group_short_name       = "secmon"
  email_receiver_name           = "internal-it"
  email_receiver_address        = "it@nionit.com"
  metric_alert_name             = "alert-${module.storage_account.name}-used-capacity"
  used_capacity_threshold_bytes = 1073741824

  tags = var.tags
}

module "monitoring" {
  source = "../../modules/monitoring"

  application_insights_name = var.application_insights_name
  resource_group_name       = module.resource_group.name
  location                  = module.resource_group.location
  tags                      = var.tags
}

module "function_app" {
  source = "../../modules/function-app"

  function_app_name                      = var.function_app_name
  service_plan_name                      = var.service_plan_name
  resource_group_name                    = module.resource_group.name
  location                               = module.resource_group.location
  storage_account_id                     = module.storage_account.id
  storage_blob_endpoint                  = module.storage_account.primary_blob_endpoint
  storage_account_access_key             = module.storage_account.primary_access_key
  storage_container_name                 = var.storage_container_name
  application_insights_connection_string = module.monitoring.connection_string

  app_settings = {
    "AZURE_FUNCTIONS_ENVIRONMENT" = "Production"
  }

  tags = var.tags
}

resource "random_string" "defender_logs_suffix" {
  length  = 5
  upper   = false
  special = false
}

resource "azurerm_storage_account" "defender_logs" {
  name                     = "stdefender${random_string.defender_logs_suffix.result}"
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  access_tier                   = "Cool"
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true

  tags = var.tags
}

resource "azurerm_storage_container" "defender_logs" {
  name                  = "defender-logs-${random_string.defender_logs_suffix.result}"
  storage_account_id    = azurerm_storage_account.defender_logs.id
  container_access_type = "private"
}

module "defender_storage_alerts" {
  source = "../../modules/storage-alerts"

  resource_group_name           = module.resource_group.name
  storage_account_id            = azurerm_storage_account.defender_logs.id
  action_group_name             = "ag-defender-logs-internal-sc-01"
  action_group_short_name       = "secmon"
  email_receiver_name           = "internal-it"
  email_receiver_address        = "it@nionit.com"
  metric_alert_name             = "alert-${azurerm_storage_account.defender_logs.name}-used-capacity"
  used_capacity_threshold_bytes = 1073741824

  tags = var.tags
}