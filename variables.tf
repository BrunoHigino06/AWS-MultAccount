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

# Secundary IPV4 vars
variable "secondary_cidr" {
  type = object({
    use_secundary_ipv4 = bool
    cidr_block     = list(string)
  })
  description = "list of a secundary IPV4 to add to the vpc"
}