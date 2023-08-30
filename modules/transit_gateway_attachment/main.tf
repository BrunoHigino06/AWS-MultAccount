# transit_gateway_attachment resource
resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_vpc_attachment" {
  count = length(var.transit_gateway_vpc_attachment)
  subnet_ids                                      = data.aws_subnet.data_subnet_id[*].id
  transit_gateway_id                              = data.aws_ec2_transit_gateway.data_transit_gateway_id[*].id
  vpc_id                                          = data.aws_vpc.data_vpc_id[*].id
  appliance_mode_support                          = var.transit_gateway_vpc_attachment[count.index].appliance_mode_support
  dns_support                                     = var.transit_gateway_vpc_attachment[count.index].dns_support
  ipv6_support                                    = var.transit_gateway_vpc_attachment[count.index].ipv6_support
  transit_gateway_default_route_table_association = var.transit_gateway_vpc_attachment[count.index].transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_vpc_attachment[count.index].transit_gateway_default_route_table_propagation

  tags = merge(var.transit_gateway_vpc_attachment[count.index].tags,
    {Name = var.transit_gateway_vpc_attachment[count.index].name}
  )

  depends_on = [
    data.aws_ec2_transit_gateway.data_transit_gateway_id,
    data.aws_subnet.data_subnet_id,
    data.aws_vpc.data_vpc_id
  ]
}