module "internet_gateway" {
  source = "./modules/internet_gateway"

  internet_gateway = [
    for internet_gateway in var.internet_gateway : {
        name     = internet_gateway.name
        vpc_name = internet_gateway.vpc_name
        tags     = var.tags
    }
  ]
  depends_on = [
    module.analytics_vpc,
    module.app_vpc
  ]
}