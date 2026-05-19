location                  = "swedencentral"
resource_group_name       = "rg-secret-expiry-internal-sc-01"
storage_account_name      = "stsecretinternal01"
application_insights_name = "appi-secret-expiry-internal-sc-01"
function_app_name         = "func-secret-expiry-internal-sc-01"
service_plan_name         = "asp-secret-expiry-internal-sc-01"
storage_container_name    = "functionapp-package"


tags = {
  project     = "azure-secret-expiry-monitor"
  environment = "internal"
  owner       = "internal-it"
  managed_by  = "opentofu"
}
