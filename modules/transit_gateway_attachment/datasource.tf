data "aws_subnet" "data_subnet_id" {
  count = length(var.subnet_names)
  filter {
    name   = "tag:Name"
    values = [var.subnet_names[count.index]]
  }
}

data "aws_vpc" "data_vpc_id" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_ec2_transit_gateway" "data_transit_gateway_id" {
  filter {
    name   = "tag:Name"
    values = [var.transit_gateway_name]
  }
}