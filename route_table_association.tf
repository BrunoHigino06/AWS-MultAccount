module "app_route_table_association" {
    source = "./modules/route_table_association"

    route_table_association = [
        for association in var.app_route_table_association : {
            route_table_unique_name = association.route_table_unique_name
            subnet_unique_name      = association.subnet_unique_name
            gateway_name     = association.gateway_name
        }
    ]
  depends_on = [
    module.internet_gateway,
    module.app_route_table,
    module.app_subnet
  ]
}

module "analytics_route_table_association" {
    source = "./modules/route_table_association"

    route_table_association = [
        for association in var.analytics_route_table_association : {
            route_table_unique_name = association.route_table_unique_name
            subnet_unique_name      = association.subnet_unique_name
            gateway_name            = association.gateway_name
        }
    ]
  depends_on = [
    module.internet_gateway,
    module.analytics_route_table,
    module.analytics_subnet
  ]
}