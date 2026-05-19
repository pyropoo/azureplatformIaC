<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_function_app"></a> [function\_app](#module\_function\_app) | ../../modules/function-app | n/a |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | ../../modules/monitoring | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../../modules/rg | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage-account | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_insights_name"></a> [application\_insights\_name](#input\_application\_insights\_name) | Name of the Application Insights instance. | `string` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | Name of the Azure Function App. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the internal environment. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group for the internal environment. | `string` | n/a | yes |
| <a name="input_service_plan_name"></a> [service\_plan\_name](#input\_service\_plan\_name) | Name of the Flex Consumption service plan. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name for the application. | `string` | n/a | yes |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | Name of the blob container used for Function deployment storage. | `string` | `"functionapp-package"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags for all resources in this environment. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->