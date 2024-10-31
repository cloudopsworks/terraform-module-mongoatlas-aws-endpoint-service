##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  sglist = try(var.settings.security_group_ids, [])
}

data "mongodbatlas_project" "this" {
  count = var.project_name != "" ? 1 : 0
  name  = var.project_name
}

data "mongodbatlas_privatelink_endpoint" "this" {
  project_id      = var.project_id != "" ? var.project_id : data.mongodbatlas_project.this[0].project_id
  private_link_id = var.private_link_id
  provider_name   = "AWS"
}

resource "aws_security_group" "default" {
  vpc_id = var.vpc.vpc_id
  name   = "mongodb-ep-${local.system_name}"

  tags_all = merge({
    Name = "mongodb-ep-${local.system_name}"
  }, local.all_tags)
}

resource "aws_security_group_rule" "default_ingress" {
  security_group_id = aws_security_group.default.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = try(var.settings.port, 27017)
  to_port           = try(var.settings.port, 27017)
  cidr_blocks       = concat(try(var.settings.vpc_cidr_blocks, []), [var.vpc.vpc_cidr_block])
}

resource "aws_vpc_endpoint" "this" {
  vpc_id              = var.vpc.vpc_id
  service_name        = data.mongodbatlas_privatelink_endpoint.this.endpoint_service_name
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.vpc.subnet_ids
  security_group_ids  = concat(local.sglist, [aws_security_group.default.id])
  private_dns_enabled = try(var.settings.private_dns, false)
  dynamic "dns_options" {
    for_each = length(try(var.settings.options, {})) > 0 ? [var.settings.options] : []
    content {
      dns_record_ip_type                             = try(dns_options.values.dns_record_ip_type, "service-defined")
      private_dns_only_for_inbound_resolver_endpoint = try(dns_options.values.private_resolver, false)
    }
  }

  tags_all = merge({
    Name = "mongodb-ep-${local.system_name}"
  }, local.all_tags)
}

resource "mongodbatlas_privatelink_endpoint_service" "this" {
  project_id          = data.mongodbatlas_privatelink_endpoint.this.project_id
  private_link_id     = data.mongodbatlas_privatelink_endpoint.this.private_link_id
  endpoint_service_id = aws_vpc_endpoint.this.id
  provider_name       = "AWS"
}