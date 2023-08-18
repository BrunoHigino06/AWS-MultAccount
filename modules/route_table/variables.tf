# route table vars
variable "route_table" {
  type                                             = list(object({
    name                                           = string
    
    }))
    description = "route table variables"
    default = null
}