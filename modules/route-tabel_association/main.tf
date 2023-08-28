# route table association resource
resource "aws_route_table_association" "route_table_association" {
  count          = length(var.route_table_association)
  subnet_id      = var.route_table_association[count.index].subnet_id
  route_table_id = var.route_table_association[count.index].route_table_id
  gateway_id     = var.route_table_association[count.index].gateway_id
}