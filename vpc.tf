module "app_vpc" {
  source = "./modules/vpc"
  
  vpc = merge(var.app_vpc,
    {tags = var.tags}
  )
}

module "analytics_vpc" {
  source = "./modules/vpc"
  
  vpc = merge(var.analytics_vpc,
    {tags = var.tags}
  )
}