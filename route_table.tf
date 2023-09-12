module "app_route_table" {
  source = "./modules/route_table"
  
  route_table = [
    for route_table in var.app_route_table :
    {
      name        = route_table.name
      unique_name = "app_${route_table.name}"
      vpc_id      = module.app_vpc.vpc_id
      tags        = var.tags
      route       = [
        for route_info in route_table.route :
        {
          cidr_block           = route_info.cidr_block
          gateway_id           = data.aws_internet_gateway.internet_gateway_id[route_info.gateway_name].id
          transit_gateway_id   = route_info.transit_gateway_name
        }
      ]
    }
  ]
  depends_on = [
    module.app_vpc,
    module.transit_gateway_attachment
  ]
}

module "analytics_route_table" {
  source = "./modules/route_table"
  
  route_table = [
    for route_table in var.analytics_route_table :
    {
      name        = route_table.name
      unique_name = "analytics_${route_table.name}"
      vpc_id      = module.analytics_vpc.vpc_id
      tags        = var.tags
      route       = [
        for route_info in route_table.route :
        {
          cidr_block           = route_info.cidr_block
          gateway_id           = route_info.gateway_id
          transit_gateway_name = route_info.transit_gateway_name
        }
      ]
    }
  ]
  depends_on = [
    module.analytics_vpc,
    module.transit_gateway_attachment
  ]
}