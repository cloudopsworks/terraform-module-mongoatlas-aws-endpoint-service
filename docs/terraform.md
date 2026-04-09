## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.4 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.40.0 |
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 2.10.0 |

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
| <a name="input_private_link_id"></a> [private\_link\_id](#input\_private\_link\_id) | (Required) The ID of the MongoDB Atlas PrivateLink endpoint resource. Obtained from the mongodbatlas\_privatelink\_endpoint resource or data source. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Optional) The ID of the MongoDB Atlas project where the private endpoint will be registered. Provide either project\_id or project\_name; if both are set, project\_id takes precedence. | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Optional) The name of the MongoDB Atlas project. Used to look up the project\_id when project\_id is not explicitly provided. | `string` | `""` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | (Optional) Configuration settings for the AWS VPC endpoint and security group.<br/><br/>Supported attributes:<br/>  security\_group\_ids = []          # (Optional) Additional security group IDs to associate with the VPC endpoint. default: []<br/>  port               = 1024        # (Optional) Starting port for the ingress TCP rule on the created security group. default: 1024 (range ends at 65535)<br/>  vpc\_cidr\_blocks    = []          # (Optional) Additional CIDR blocks allowed in the security group ingress rule, besides the VPC CIDR. default: []<br/>  private\_dns        = false       # (Optional) Whether to enable private DNS on the VPC endpoint. default: false<br/>  options = {<br/>    dns\_record\_ip\_type = "service-defined"  # (Optional) IP address type for DNS records. Values: "service-defined", "ipv4", "dualstack", "ipv6". default: "service-defined"<br/>    private\_resolver   = false              # (Optional) Restrict private DNS resolution to inbound resolver endpoints only. default: false<br/>  } | `any` | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | n/a | `string` | `"001"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | (Required) VPC configuration for the AWS VPC endpoint and security group.<br/><br/>Supported attributes:<br/>  vpc\_id         = ""  # (Required) The ID of the AWS VPC where the endpoint will be created.<br/>  vpc\_cidr\_block = ""  # (Required) The primary CIDR block of the VPC; used as an allowed source in the security group ingress rule.<br/>  subnet\_ids     = []  # (Required) List of subnet IDs in which the VPC endpoint network interfaces will be placed. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_security_group_id"></a> [endpoint\_security\_group\_id](#output\_endpoint\_security\_group\_id) | n/a |
| <a name="output_endpoint_security_group_name"></a> [endpoint\_security\_group\_name](#output\_endpoint\_security\_group\_name) | n/a |
| <a name="output_endpoint_vpc_dns_entry"></a> [endpoint\_vpc\_dns\_entry](#output\_endpoint\_vpc\_dns\_entry) | n/a |
| <a name="output_endpoint_vpc_endpoint_id"></a> [endpoint\_vpc\_endpoint\_id](#output\_endpoint\_vpc\_endpoint\_id) | n/a |
| <a name="output_endpoint_vpc_endpoint_status"></a> [endpoint\_vpc\_endpoint\_status](#output\_endpoint\_vpc\_endpoint\_status) | n/a |
