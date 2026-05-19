# Monitoring Module

Creates Azure Application Insights for application monitoring.

## Usage

```hcl
module "monitoring" {
  source = "../../modules/monitoring"

  application_insights_name = "appi-secret-expiry-internal-sc-01"
  resource_group_name       = "rg-secret-expiry-internal-sc-01"
  location                  = "swedencentral"

  tags = {
    project     = "azure-secret-expiry-monitor"
    environment = "internal"
    managed_by  = "opentofu"
  }
}
```

## Notes
This module currently creates only Application Insights.
Log Analytics is intentionally excluded from v1 to keep the infrastructure simple and low-cost.
The connection string output is intended to be passed into the Function App later.


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
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_insights_name"></a> [application\_insights\_name](#input\_application\_insights\_name) | Name of the Application Insights instance. | `string` | n/a | yes |
| <a name="input_application_type"></a> [application\_type](#input\_application\_type) | Type of application being monitored. | `string` | `"web"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for Application Insights. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where Application Insights will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to Application Insights. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The Application Insights connection string. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Application Insights instance. |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | The Application Insights instrumentation key. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Application Insights instance. |
<!-- END_TF_DOCS -->