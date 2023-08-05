module "app_vpc" {
  source = "./modules/vpc_subnet"
  
  vpc = merge(var.app_vpc,
    {tags = var.tags}
  )
}