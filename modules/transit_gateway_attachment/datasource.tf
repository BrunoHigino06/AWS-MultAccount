locals {
  subnet_names = flatten([for attachment in var.transit_gateway_vpc_attachment : attachment.subnet_names])
}

data "aws_subnet" "data_subnet_id" {
  for_each = { for subnet in local.subnet_names : subnet => subnet }

  filter {
    name = "tag:Name"
    values = [each.key]
  }
  
}

data "aws_vpc" "data_vpc_id" {
  count = length(var.transit_gateway_vpc_attachment)
  filter {
    name   = "tag:Name"
    values = [for attachment in var.transit_gateway_vpc_attachment : attachment.vpc_name]
  }
}

data "aws_ec2_transit_gateway" "data_transit_gateway_id" {
  count = length(var.transit_gateway_vpc_attachment)
  filter {
    name   = "tag:Name"
    values = [for attachment in var.transit_gateway_vpc_attachment : attachment.transit_gateway_name]
  }
}