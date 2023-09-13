locals {
  internet_gateway_routes = flatten([for rt in var.route_table : [for route in rt.route : { name = route.gateway_name, type = route.gateway_type }]])
  transit_gateway_routes  = flatten([for rt in var.route_table : [for route in rt.route : { name = route.gateway_name, type = route.gateway_type }]])
  nat_gateway_routes      = flatten([for rt in var.route_table : [for route in rt.route : { name = route.gateway_name, type = route.gateway_type }]])
}

data "aws_internet_gateway" "internet_gateway_id" {
  for_each = { for route in local.internet_gateway_routes : route.name => route if route.type == "gateway_id" }

  filter {
    name   = "tag:Name"
    values = [each.value.name]
  }
}

data "aws_ec2_transit_gateway" "transit_gateway_id" {
  for_each = { for route in local.transit_gateway_routes : route.name => route if route.type == "transit_gateway_id" }

  filter {
    name   = "tag:Name"
    values = [each.value.name]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_nat_gateway" "nat_gateway_id" {
  for_each = { for route in local.nat_gateway_routes : route.name => route if route.type == "nat_gateway_id" }

  filter {
    name   = "tag:Name"
    values = [each.value.name]
  }
}
