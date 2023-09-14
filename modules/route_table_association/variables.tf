# route table association variables
variable "route_table_association" {
  type = list(object({
    subnet_name      = optional(string)
    route_table_name  = string
    gateway_name      = optional(string)
  }))
  description = "route table association variables"
  default = null
}