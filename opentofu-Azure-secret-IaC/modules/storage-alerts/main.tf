resource "azurerm_monitor_action_group" "this" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.action_group_short_name

  email_receiver {
    name          = var.email_receiver_name
    email_address = var.email_receiver_address
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "used_capacity" {
  name                = var.metric_alert_name
  resource_group_name = var.resource_group_name
  scopes              = [var.storage_account_id]
  description         = "Alert for storage account used capacity"
  severity            = 3
  frequency           = "PT5M"
  window_size         = "PT1H"

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.used_capacity_threshold_bytes
    skip_metric_validation = true
  }

  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }

  tags = var.tags
}