module "app_subnet" {
  source = "./modules/subnet"

  subnet = [
    for subnet in var.app_subnet : {
      name              = subnet.name
      unique_name       = "app_${subnet.name}"
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
      vpc_id            = module.app_vpc.vpc_id
      tags              = var.tags
    }
  ]
  depends_on = [ 
    module.app_vpc
  ]
}

module "analytics_subnet" {
  source = "./modules/subnet"

  subnet = [
    for subnet in var.analytics_subnet : {
      name              = subnet.name
      unique_name       = "analytics_${subnet.name}"
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
      vpc_id            = module.analytics_vpc.vpc_id
      tags              = var.tags
    }
  ]

  depends_on = [
    module.analytics_vpc
  ]
}