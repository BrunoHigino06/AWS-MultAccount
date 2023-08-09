module "app_subnet" {
  source = "./modules/subnet"

  subnet = [
    for subnet in var.app_subnet : {
      name              = subnet.name
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
      vpc_id            = module.app_vpc.vpc_id
      tags              = var.tags
    } 
  ]
}