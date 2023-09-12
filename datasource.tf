locals {
  gateway_name = flatten([
    for rt in var.app_route_table :
    [for route in rt.route : route.gateway_name]
  ])
}

data "aws_internet_gateway" "internet_gateway_id" {
    for_each = { for internet_gateway in local.gateway_name : internet_gateway => internet_gateway }

  filter {
    name   = "tag:Name"
    values = [each.key]
  }
}