module "app_network_acl" {
  source = "./modules/network_acl"

  network_acl = [ 
    for network_acl in var.app_network_acl :
    {
        name       = network_acl.name
        vpc_id     = module.app_vpc.vpc_id
        tags       = var.tags
        subnet_ids = [
          module.app_subnet.subnet_id[0], 
          module.app_subnet.subnet_id[1], 
          module.app_subnet.subnet_id[2], 
          module.app_subnet.subnet_id[3], 
          module.app_subnet.subnet_id[4], 
          module.app_subnet.subnet_id[5],
          module.app_subnet.subnet_id[6], 
          module.app_subnet.subnet_id[7], 
          module.app_subnet.subnet_id[8]
        ]
        ingress = [
          for ingress_info in network_acl.ingress :
          {
            protocol   = ingress_info.protocol
            rule_no    = ingress_info.rule_no
            action     = ingress_info.action
            cidr_block = ingress_info.cidr_block
            from_port  = ingress_info.from_port
            to_port    = ingress_info.to_port
          }
        ]
        egress = [
          for egress_info in network_acl.egress :
          {
            protocol   = egress_info.protocol
            rule_no    = egress_info.rule_no
            action     = egress_info.action
            cidr_block = egress_info.cidr_block
            from_port  = egress_info.from_port
            to_port    = egress_info.to_port
          }
        ]
    }
  ]
}

module "analytics_network_acl" {
  source = "./modules/network_acl"

  network_acl = [ 
    for network_acl in var.analytics_network_acl :
    {
        name       = network_acl.name
        vpc_id     = module.app_vpc.vpc_id
        tags       = var.tags
        subnet_ids = [
          module.analytics_subnet.subnet_id[0], 
          module.analytics_subnet.subnet_id[1], 
          module.analytics_subnet.subnet_id[2]
        ]
        ingress = [
          for ingress_info in network_acl.ingress :
          {
            protocol   = ingress_info.protocol
            rule_no    = ingress_info.rule_no
            action     = ingress_info.action
            cidr_block = ingress_info.cidr_block
            from_port  = ingress_info.from_port
            to_port    = ingress_info.to_port
          }
        ]
        egress = [
          for egress_info in network_acl.egress :
          {
            protocol   = egress_info.protocol
            rule_no    = egress_info.rule_no
            action     = egress_info.action
            cidr_block = egress_info.cidr_block
            from_port  = egress_info.from_port
            to_port    = egress_info.to_port
          }
        ]
    }
  ]
}