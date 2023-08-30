module "transit_gateway" {
  source = "./modules/transit_gateway"

  transit_gateway = [
    for transit_gateway in var.TGW_ENV : 
    {
        name        = transit_gateway.name
        description = transit_gateway.description
        tags        = var.tags
    }
  ]
}