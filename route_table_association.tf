module "app_route_table_association" {
  source = "./modules/route-tabel_association"

  route_table_association = [
    {
        subnet_id      = module.app_subnet.subnet_id[0]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[1]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[2]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[3]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[4]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[5]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[6]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[7]
        route_table_id = module.app_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.app_subnet.subnet_id[8]
        route_table_id = module.app_route_table.route_table_id[0]
    }
  ]
}

module "analytics_route_table_association" {
  source = "./modules/route-tabel_association"

  route_table_association = [
    {
        subnet_id      = module.analytics_subnet.subnet_id[0]
        route_table_id = module.analytics_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.analytics_subnet.subnet_id[1]
        route_table_id = module.analytics_route_table.route_table_id[0]
    },
    {
        subnet_id      = module.analytics_subnet.subnet_id[2]
        route_table_id = module.analytics_route_table.route_table_id[0]
    }
  ]
}