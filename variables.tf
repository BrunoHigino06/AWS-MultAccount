# Tags variables
variable "tags" {
  type = map(string)
  description = "Tags for common use"
}

# vpc_app variables
variable "app_vpc" {
  type = object({
    name       = string 
    cidr_block = string
  })
  description = "app_vpc module variables"
}

