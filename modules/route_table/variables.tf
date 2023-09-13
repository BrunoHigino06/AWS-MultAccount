# route table vars
variable "route_table" {
  type                          = list(object({
    name                        = string
    vpc_id                      = string
    unique_name                 = string
    propagating_vgws            = optional(list(string))
    route                       = list(object({
      cidr_block                = string
      gateway_name              = string
      gateway_type              = string

    }))
    tags                        = map(string)
    
    }))
    description                 = "route table variables"
    default = null
}