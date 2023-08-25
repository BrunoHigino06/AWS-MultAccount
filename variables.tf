# Tags variables
variable "tags" {
  type = map(string)
  description = "Tags for common use"
}

# app environment variables
  # app_vpc variables
    variable "app_vpc" {
      type = object({
        name       = string 
        cidr_block = string
      })
      description = "app_vpc module variables"
    }

  # app_subnets variables
    variable "app_subnet" {
    type                                             = list(object({
        name                                           = string
        vpc_id                                         = optional(string)
        cidr_block                                     = optional(string)
        availability_zone                              = optional(string)
      }))
      description = "app subnet variables"
      default = null
    }
  # app_route_table variables
    variable "app_route_table" {
    type                          = list(object({
      name                        = string
        route                       = list(object({
          cidr_block                = string
          gateway_id                = optional(string)
          transit_gateway_id        = optional(string)
        }))      
      }))
      description                 = "route table variables"
      default = null
    }

# analytics environment variables
  # analytics_vpc variables
    variable "analytics_vpc" {
      type = object({
        name       = string 
        cidr_block = string
      })
      description = "app_vpc module variables"
    }
  # analytics_subnets variables
    variable "analytics_subnet" {
      type                                             = list(object({
        name                                           = string
        vpc_id                                         = optional(string)
        cidr_block                                     = optional(string)
        availability_zone                              = optional(string)
      }))
      description = "analytics subnet variables"
      default = null
    }  