# Global variables
  # Tags variables
    variable "tags" {
      type = map(string)
      description = "Tags for common use"
    }
  # Internet gateway variables
    variable "internet_gateway" {
      type            = list(object({
        name          = string
        vpc_name      = string
      }))
      description = "Internet gateway variables"
      default = null
    }
  # Transit gateway variable
    variable "transit_gateway" {
      type                              = list(object({
        name                            = string
        description                     = optional(string)
        amazon_side_asn                 = optional(string)
        auto_accept_shared_attachments  = optional(string)
        default_route_table_association = optional(string)
        default_route_table_propagation = optional(string)
        dns_support                     = optional(string)
        transit_gateway_cidr_blocks     = optional(string)
        vpn_ecmp_support                = optional(string)
      }))
      default = null
      description = "Transit gateway variables"
    }
  # transit_gateway_route_table variables
    variable "transit_gateway_route_table" {
      type                 = list(object({
        name               = string
      }))
      default = null
      description = "Transit gateway route table variables"
    }
  # transit_gateway_vpc_attachment variables
    variable "transit_gateway_vpc_attachment" {
      type = list(object({
        name                                              = string
        subnet_unique_names                               = list(string)
        transit_gateway_name                              = string
        vpc_name                                          = string
      }))
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
    type                            = list(object({
      name                          = string
        route                       = list(object({
          cidr_block                = string
          gateway_name              = optional(string)
          transit_gateway_name      = optional(string)
        }))      
      }))
      description                   = "route table variables"
      default = null
    }
  # route table association variables
    variable "app_route_table_association" {
      type = list(object({
        subnet_unique_name      = optional(string)
        route_table_unique_name  = string
        gateway_name      = optional(string)
      }))
      description = "route table association variables"
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
        ingress                = list(object({
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
    type                            = list(object({
      name                          = string
        route                       = list(object({
          cidr_block                = string
          gateway_name              = optional(string)
          transit_gateway_name      = optional(string)
        }))      
      }))
      description                   = "route table variables"
      default = null
    }
  # route table association variables
    variable "analytics_route_table_association" {
      type = list(object({
        subnet_unique_name      = optional(string)
        route_table_unique_name  = string
        gateway_name      = optional(string)
      }))
      description = "route table association variables"
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