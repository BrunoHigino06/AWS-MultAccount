# Tags for common use inputs
tags = {
    Environment = "production"
    Owner       = "Cloud Admin"
}

# app_vpc inputs
app_vpc = {
    name       = "app_vpc"
    cidr_block = "10.0.0.0/16"
}

# Secundary IPV4
secondary_cidr = {
    use_secundary_ipv4 = true
    cidr_block         = [
        "10.20.0.0/16"
    ]
}