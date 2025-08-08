## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.4 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | ~> 1.32 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.73.0 |
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 1.21.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.default_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [mongodbatlas_privatelink_endpoint_service.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint_service) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [mongodbatlas_privatelink_endpoint.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/privatelink_endpoint) | data source |
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Establish this is a HUB or spoke configuration | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | n/a | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_private_link_id"></a> [private\_link\_id](#input\_private\_link\_id) | The ID of the private link | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (optional) The ID of the project where the cluster will be created | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (optional) The name of the project where the cluster will be created | `string` | `""` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Settings for the module | `any` | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | n/a | `string` | `"001"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC where the cluster will be created | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_security_group_id"></a> [endpoint\_security\_group\_id](#output\_endpoint\_security\_group\_id) | n/a |
| <a name="output_endpoint_security_group_name"></a> [endpoint\_security\_group\_name](#output\_endpoint\_security\_group\_name) | n/a |
| <a name="output_endpoint_vpc_dns_entry"></a> [endpoint\_vpc\_dns\_entry](#output\_endpoint\_vpc\_dns\_entry) | n/a |
| <a name="output_endpoint_vpc_endpoint_id"></a> [endpoint\_vpc\_endpoint\_id](#output\_endpoint\_vpc\_endpoint\_id) | n/a |
| <a name="output_endpoint_vpc_endpoint_status"></a> [endpoint\_vpc\_endpoint\_status](#output\_endpoint\_vpc\_endpoint\_status) | n/a |
