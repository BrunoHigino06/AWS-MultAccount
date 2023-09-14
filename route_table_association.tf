module "app_route_table_association" {
    source = "./modules/route_table_association"

    route_table_association = [
        for association in var.app_route_table_association : {
            route_table_name = association.route_table_name
            subnet_name      = association.subnet_name
            gateway_name     = association.gateway_name
        }
    ]
  depends_on = [
    module.internet_gateway,
    module.app_route_table,
    module.app_subnet
  ]
}