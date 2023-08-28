# route table association variables
variable "route_table_association" {
  type = list(object({
    subnet_id       = optional(string)
    route_table_id  = string
    gateway_id      = optional(string)
  }))
  description = "route table association variables"
  default = null
}