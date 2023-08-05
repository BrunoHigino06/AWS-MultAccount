# VPC resource
resource "aws_vpc" "vpc" {
  cidr_block                           = var.vpc.cidr_block
  instance_tenancy                     = var.vpc.instance_tenancy
  ipv4_ipam_pool_id                    = var.vpc.ipv4_ipam_pool_id
  ipv4_netmask_length                  = var.vpc.ipv4_netmask_length
  ipv6_cidr_block                      = var.vpc.ipv6_cidr_block
  ipv6_ipam_pool_id                    = var.vpc.ipv6_ipam_pool_id
  ipv6_netmask_length                  = var.vpc.ipv6_netmask_length
  ipv6_cidr_block_network_border_group = var.vpc.ipv6_cidr_block_network_border_group
  enable_dns_support                   = var.vpc.enable_dns_support
  enable_network_address_usage_metrics = var.vpc.enable_network_address_usage_metrics
  enable_dns_hostnames                 = var.vpc.enable_dns_hostnames
  assign_generated_ipv6_cidr_block     = var.vpc.assign_generated_ipv6_cidr_block
  tags = merge(var.vpc.tags,
    {Name = var.vpc.name}
  )
}
