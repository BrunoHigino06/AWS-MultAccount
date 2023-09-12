# route table resource
resource "aws_route_table" "route_table" {
  count            = length(var.route_table)
  vpc_id           = var.route_table[count.index].vpc_id
  propagating_vgws = var.route_table[count.index].propagating_vgws
  dynamic "route" {
    for_each = var.route_table[count.index].route
    content {
      cidr_block                = route.value.cidr_block
      gateway_id                = route.value.gateway_id
      nat_gateway_id            = route.value.nat_gateway_id
      carrier_gateway_id        = route.value.carrier_gateway_id
      core_network_arn          = route.value.core_network_arn
      egress_only_gateway_id    = route.value.egress_only_gateway_id
      local_gateway_id          = route.value.local_gateway_id
      network_interface_id      = route.value.network_interface_id
      transit_gateway_id        = route.value.transit_gateway_id
      vpc_endpoint_id           = route.value.vpc_endpoint_id
      vpc_peering_connection_id = route.value.vpc_peering_connection_id
    }

  }
  tags    = merge(var.route_table[count.index].tags,
    {
      Name        = var.route_table[count.index].name,
      unique_name = var.route_table[count.index].unique_name
    }
  )
  depends_on = [
    
  ]
}