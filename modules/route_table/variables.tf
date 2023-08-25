# route table vars
variable "route_table" {
  type                          = list(object({
    name                        = string
    vpc_id                      = string
    propagating_vgws            = optional(list(string))
    route                       = list(object({
      cidr_block                = string
      gateway_id                = optional(string)
      nat_gateway_id            = optional(string)
      carrier_gateway_id        = optional(string)
      core_network_arn          = optional(string)
      egress_only_gateway_id    = optional(string)
      local_gateway_id          = optional(string)
      network_interface_id      = optional(string)
      transit_gateway_id        = optional(string)
      vpc_endpoint_id           = optional(string)
      vpc_peering_connection_id = optional(string)
    }))
    tags                        = map(string)
    
    }))
    description                 = "route table variables"
    default = null
}