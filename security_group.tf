module "app_seucrity_group" {
  source = "./modules/security_group"

  security_group = [
    for security_group in var.app_security_group :
    {
        name        = security_group.name
        vpc_id      = module.app_vpc.vpc_id
        tags        = var.tags
        description = security_group.description
        egress = [
            for egress_info in security_group.egress :
            {
                from_port            = egress_info.from_port
                to_port              = egress_info.to_port
                protocol             = egress_info.protocol
                cidr_blocks          = egress_info.cidr_blocks
                ipv6_cidr_blocks     = egress_info.ipv6_cidr_blocks
                description          = egress_info.description
            }
        ]
        ingress = [
            for ingress_info in security_group.ingress :
            {
                from_port            = ingress_info.from_port
                to_port              = ingress_info.to_port
                protocol             = ingress_info.protocol
                cidr_blocks          = ingress_info.cidr_blocks
                ipv6_cidr_blocks     = ingress_info.ipv6_cidr_blocks
                description          = ingress_info.description
            }
        ]
    }
  ]
  depends_on = [
    module.app_vpc
  ]
}

module "analytics_security_group" {
  source = "./modules/security_group"

  security_group = [
    for security_group in var.analytics_security_group :
    {
        name        = security_group.name
        vpc_id      = module.app_vpc.vpc_id
        tags        = var.tags
        description = security_group.description
        egress = [
            for egress_info in security_group.egress :
            {
                from_port            = egress_info.from_port
                to_port              = egress_info.to_port
                protocol             = egress_info.protocol
                cidr_blocks          = egress_info.cidr_blocks
                ipv6_cidr_blocks     = egress_info.ipv6_cidr_blocks
                description          = egress_info.description
            }
        ]
        ingress = [
            for ingress_info in security_group.ingress :
            {
                from_port            = ingress_info.from_port
                to_port              = ingress_info.to_port
                protocol             = ingress_info.protocol
                cidr_blocks          = ingress_info.cidr_blocks
                ipv6_cidr_blocks     = ingress_info.ipv6_cidr_blocks
                description          = ingress_info.description
            }
        ]
    }
  ]
  depends_on = [
    module.analytics_vpc
  ]
}