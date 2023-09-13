resource "aws_route_table" "route_table" {
  count            = length(var.route_table)
  vpc_id           = var.route_table[count.index].vpc_id
  propagating_vgws = var.route_table[count.index].propagating_vgws
  
  dynamic "route" {
    for_each = var.route_table[count.index].route
    content {
      cidr_block                = route.value.cidr_block
      gateway_id                = route.value.gateway_type == "gateway_id" ? data.aws_internet_gateway.internet_gateway_id[route.value.gateway_name].id : null
      nat_gateway_id            = route.value.gateway_type == "nat_gateway_id" ? data.aws_nat_gateway.nat_gateway_id[route.value.gateway_name].id : null
      carrier_gateway_id        = route.value.gateway_type == "carrier_gateway_id" ? route.value.gateway_name : null
      core_network_arn          = route.value.gateway_type == "core_network_arn" ? route.value.gateway_name : null
      egress_only_gateway_id    = route.value.gateway_type == "egress_only_gateway_id" ? route.value.gateway_name : null
      local_gateway_id          = route.value.gateway_type == "local_gateway_id" ? route.value.gateway_name : null
      network_interface_id      = route.value.gateway_type == "network_interface_id" ? route.value.gateway_name : null
      transit_gateway_id        = route.value.gateway_type == "transit_gateway_id" ? data.aws_ec2_transit_gateway.transit_gateway_id[route.value.gateway_name].id : null
      vpc_endpoint_id           = route.value.gateway_type == "vpc_endpoint_id" ? route.value.gateway_name : null
      vpc_peering_connection_id = route.value.gateway_type == "vpc_peering_connection_id" ? route.value.gateway_name : null
    }
  }
  
  tags = merge(var.route_table[count.index].tags, {
    Name        = var.route_table[count.index].name,
    unique_name = var.route_table[count.index].unique_name
  })
  
  depends_on = [
    data.aws_ec2_transit_gateway.transit_gateway_id,
    data.aws_internet_gateway.internet_gateway_id
  ]
}
