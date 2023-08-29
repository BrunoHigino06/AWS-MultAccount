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
  # app_network_acl variables
    variable "app_network_acl" {
      type            = list(object({
        name          = string
        egress        = list(object({
          protocol    = string 
          rule_no     = string
          action      = string
          cidr_block  = string
          from_port   = string
          to_port     = string
        }))
        ingress       = list(object({
          protocol    = string 
          rule_no     = string
          action      = string
          cidr_block  = string
          from_port   = string
          to_port     = string
        }))
      }))
    }
  # app security group vars
    variable "app_security_group" {
      type                     = list(object({
        name                   = optional(string)
        description            = optional(string)
        egress                 = list(object({
          from_port            = string 
          to_port              = string
          protocol             = string
          cidr_blocks          = optional(list(string))
          description          = optional(string)
          ipv6_cidr_blocks     = optional(list(string))
        }))
        ingress       = list(object({
          from_port            = string 
          to_port              = string
          protocol             = string
          cidr_blocks          = optional(list(string))
          description          = optional(string)
          ipv6_cidr_blocks     = optional(list(string))
        }))
      }))
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
  # analytics_route_table variables
    variable "analytics_route_table" {
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
  # analytics_network_acl variable
    variable "analytics_network_acl" {
      type            = list(object({
        name          = string
        egress        = list(object({
          protocol    = string 
          rule_no     = string
          action      = string
          cidr_block  = string
          from_port   = string
          to_port     = string
        }))
        ingress       = list(object({
          protocol    = string 
          rule_no     = string
          action      = string
          cidr_block  = string
          from_port   = string
          to_port     = string
        }))
      }))
    }
  # analytics security group vars
    variable "analytics_security_group" {
      type                     = list(object({
        name                   = optional(string)
        description            = optional(string)
        egress                 = list(object({
          from_port            = string 
          to_port              = string
          protocol             = string
          cidr_blocks          = optional(list(string))
          description          = optional(string)
          ipv6_cidr_blocks     = optional(list(string))
        }))
        ingress       = list(object({
          from_port            = string 
          to_port              = string
          protocol             = string
          cidr_blocks          = optional(list(string))
          description          = optional(string)
          ipv6_cidr_blocks     = optional(list(string))
        }))
      }))
    }