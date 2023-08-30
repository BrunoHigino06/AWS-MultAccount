module "transit_gateway" {
  source = "./modules/transit_gateway"

  transit_gateway = [
    for transit_gateway in var.transit_gateway : 
    {
        name        = transit_gateway.name
        description = transit_gateway.description
        tags        = var.tags
    }
  ]
}