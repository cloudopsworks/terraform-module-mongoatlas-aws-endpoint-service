##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "project_id" {
  description = "(Optional) The ID of the MongoDB Atlas project where the private endpoint will be registered. Provide either project_id or project_name; if both are set, project_id takes precedence."
  type        = string
  default     = ""
}

variable "project_name" {
  description = "(Optional) The name of the MongoDB Atlas project. Used to look up the project_id when project_id is not explicitly provided."
  type        = string
  default     = ""
}

variable "private_link_id" {
  description = "(Required) The ID of the MongoDB Atlas PrivateLink endpoint resource. Obtained from the mongodbatlas_privatelink_endpoint resource or data source."
  type        = string
}

variable "settings" {
  description = <<-EOT
    (Optional) Configuration settings for the AWS VPC endpoint and security group.

    Supported attributes:
      security_group_ids = []          # (Optional) Additional security group IDs to associate with the VPC endpoint. default: []
      port               = 1024        # (Optional) Starting port for the ingress TCP rule on the created security group. default: 1024 (range ends at 65535)
      vpc_cidr_blocks    = []          # (Optional) Additional CIDR blocks allowed in the security group ingress rule, besides the VPC CIDR. default: []
      private_dns        = false       # (Optional) Whether to enable private DNS on the VPC endpoint. default: false
      options = {
        dns_record_ip_type = "service-defined"  # (Optional) IP address type for DNS records. Values: "service-defined", "ipv4", "dualstack", "ipv6". default: "service-defined"
        private_resolver   = false              # (Optional) Restrict private DNS resolution to inbound resolver endpoints only. default: false
      }
  EOT
  type        = any
  default     = {}
}

variable "vpc" {
  description = <<-EOT
    (Required) VPC configuration for the AWS VPC endpoint and security group.

    Supported attributes:
      vpc_id         = ""  # (Required) The ID of the AWS VPC where the endpoint will be created.
      vpc_cidr_block = ""  # (Required) The primary CIDR block of the VPC; used as an allowed source in the security group ingress rule.
      subnet_ids     = []  # (Required) List of subnet IDs in which the VPC endpoint network interfaces will be placed.
  EOT
  type        = any
  default     = {}
}
