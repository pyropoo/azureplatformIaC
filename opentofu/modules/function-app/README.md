# Function App Module

Creates an Azure Functions Flex Consumption app on Linux for the secret expiry monitor.

## What it creates

- Flex Consumption service plan
- Private blob container for deployment storage
- Linux Flex Consumption Function App
- System-assigned managed identity

## Usage

```hcl
module "function_app" {
  source = "../../modules/function-app"

  function_app_name                     = "func-secret-expiry-internal-sc-01"
  service_plan_name                     = "asp-secret-expiry-internal-sc-01"
  resource_group_name                   = "rg-secret-expiry-internal-sc-01"
  location                              = "swedencentral"
  storage_account_id                    = "<storage-account-id>"
  storage_blob_endpoint                 = "<blob-endpoint>"
  storage_account_access_key            = "<storage-access-key>"
  application_insights_connection_string = "<app-insights-connection-string>"

  tags = {
    project     = "azure-secret-expiry-monitor"
    environment = "internal"
    managed_by  = "opentofu"
  }
} 
```
## Notes
Uses Flex Consumption on Linux.
Uses Application Insights via APPLICATIONINSIGHTS_CONNECTION_STRING.
Uses a system-assigned managed identity.
Extra app settings can be passed through app_settings.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_function_app_flex_consumption.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app_flex_consumption) | resource |
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_storage_container.deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | Extra application settings to apply to the Function App. | `map(string)` | `{}` | no |
| <a name="input_application_insights_connection_string"></a> [application\_insights\_connection\_string](#input\_application\_insights\_connection\_string) | Application Insights connection string. | `string` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | Name of the Azure Function App. | `string` | n/a | yes |
| <a name="input_instance_memory_in_mb"></a> [instance\_memory\_in\_mb](#input\_instance\_memory\_in\_mb) | Memory size in MB for each Flex Consumption instance. | `number` | `2048` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the Function App. | `string` | n/a | yes |
| <a name="input_maximum_instance_count"></a> [maximum\_instance\_count](#input\_maximum\_instance\_count) | Maximum number of instances for the Flex Consumption Function App. | `number` | `50` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the Function App will be created. | `string` | n/a | yes |
| <a name="input_runtime_name"></a> [runtime\_name](#input\_runtime\_name) | Runtime name for the Flex Function App. | `string` | `"python"` | no |
| <a name="input_runtime_version"></a> [runtime\_version](#input\_runtime\_version) | Runtime version for the Flex Function App. | `string` | `"3.11"` | no |
| <a name="input_service_plan_name"></a> [service\_plan\_name](#input\_service\_plan\_name) | Name of the Azure Service Plan used for Flex Consumption. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | Primary access key of the storage account. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | ID of the storage account used by the Function App. | `string` | n/a | yes |
| <a name="input_storage_blob_endpoint"></a> [storage\_blob\_endpoint](#input\_storage\_blob\_endpoint) | Primary blob endpoint of the storage account. | `string` | n/a | yes |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | Name of the private blob container used for Flex Function deployment storage. | `string` | `"functionapp-package"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname of the Function App. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Function App. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Function App. |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The principal ID of the system-assigned managed identity. |
| <a name="output_service_plan_id"></a> [service\_plan\_id](#output\_service\_plan\_id) | The ID of the Flex Consumption service plan. |
| <a name="output_storage_container_name"></a> [storage\_container\_name](#output\_storage\_container\_name) | The blob container name used by the Function App. |
<!-- END_TF_DOCS -->