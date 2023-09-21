module "app_route_table" {
  source = "./modules/route_table"

  route_table = [
    for route_table in var.app_route_table :
    {
        name                  = route_table.name
        unique_name           = "app_${route_table.name}"
        vpc_id                = module.app_vpc.vpc_id
        tags                  = var.tags
        route                 = [
            for route in route_table.route : 
            {
                cidr_block           = route.cidr_block
                gateway_name         = route.gateway_name
                transit_gateway_name = route.transit_gateway_name
            }
        ]
    }
  ]
  depends_on = [
    module.internet_gateway,
    module.transit_gateway
  ]
}

module "analytics_route_table" {
  source = "./modules/route_table"

  route_table = [
    for route_table in var.analytics_route_table :
    {
        name                  = route_table.name
        unique_name           = "analytics_${route_table.name}"
        vpc_id                = module.analytics_vpc.vpc_id
        tags                  = var.tags
        route                 = [
            for route in route_table.route : 
            {
                cidr_block           = route.cidr_block
                gateway_name         = route.gateway_name
                transit_gateway_name = route.transit_gateway_name
            }
        ]
    }
  ]
  depends_on = [
    module.internet_gateway,
    module.transit_gateway
  ]
}