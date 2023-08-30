module "transit_gateway_route_table" {
  source = "./modules/transit_gateway_route_table"

  transit_gateway_route_table = [
    for transit_gateway_route_table in var.transit_gateway_route_table :
    {
        name               = transit_gateway_route_table.name
        tags                = var.tags
        transit_gateway_id = module.transit_gateway.transit_gateway_id[0]
    }
  ]

  depends_on = [
    module.transit_gateway
  ]
}