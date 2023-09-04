module "transit_gateway_attachment" {
  source = "./modules/transit_gateway_attachment"

  transit_gateway_vpc_attachment = [
    for transit_gateway_vpc_attachment in var.transit_gateway_vpc_attachment:
    {
      name                  = transit_gateway_vpc_attachment.name
      subnet_names          = transit_gateway_vpc_attachment.subnet_names
      transit_gateway_name  = transit_gateway_vpc_attachment.transit_gateway_name
      vpc_name              = transit_gateway_vpc_attachment.vpc_name
      tags                  = var.tags
    }
  ]

  depends_on = [
    module.app_vpc,
    module.analytics_vpc,
    module.analytics_subnet,
    module.app_subnet,
    module.transit_gateway,
  ]
}