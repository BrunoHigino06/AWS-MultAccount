# Global inputs
    # Tags for common use inputs
        tags = {
            Environment = "production"
            Owner       = "Cloud Admin"
        }
    # Transit gateway inputs
        transit_gateway = [
            {
                name = "TGW_ENV"
                description = "Transit gateway to make communication between app account and analytics account"
            }
        ]
    # Transit gateway route table inputs
        transit_gateway_route_table = [
            {
                name = "app_TGW_route_table"
            },
            {
                name = "analytics_TGW_route_table"
            }
        ]
    # transit_gateway_route_table inputs
        transit_gateway_vpc_attachment = [ 
            {
                name                 = "app_attachment"
                subnet_unique_names  = ["app_transport_1", "app_transport_2", "app_transport_3"]
                transit_gateway_name = "TGW_ENV"
                vpc_name             = "app_vpc"
            },
            {
                name                 = "analytics_attachment"
                subnet_unique_names  = ["analytics_transport_1", "analytics_transport_2", "analytics_transport_3"]
                transit_gateway_name = "TGW_ENV"
                vpc_name             = "analytics_vpc"
            }
        ]

# app environment inputs
    # app_vpc inputs
        app_vpc = {
            name       = "app_vpc"
            cidr_block = "10.0.0.0/16"
        }

    # app_subnets inputs
        app_subnet = [
            {
                name              = "alb_1"
                cidr_block        = "10.0.1.0/24"
                availability_zone = "us-east-1a"
            },
            {
                name              = "alb_2"
                cidr_block        = "10.0.2.0/24"
                availability_zone = "us-east-1b"
            },
            {
                name              = "alb_3"
                cidr_block        = "10.0.3.0/24"
                availability_zone = "us-east-1c"
            },
            {
                name              = "frontend_1"
                cidr_block        = "10.0.11.0/24"
                availability_zone = "us-east-1a"
            },
            {
                name              = "frontend_2"
                cidr_block        = "10.0.12.0/24"
                availability_zone = "us-east-1b"
            },
            {
                name              = "frontend_3"
                cidr_block        = "10.0.13.0/24"
                availability_zone = "us-east-1c"
            },
            {
                name              = "database_1"
                cidr_block        = "10.0.31.0/24"
                availability_zone = "us-east-1a"
            },
            {
                name              = "database_2"
                cidr_block        = "10.0.32.0/24"
                availability_zone = "us-east-1b"
            },
            {
                name              = "database_3"
                cidr_block        = "10.0.33.0/24"
                availability_zone = "us-east-1c"
            },
            {
                name              = "transport_1"
                cidr_block        = "10.0.41.0/24"
                availability_zone = "us-east-1a"
            },
            {
                name              = "transport_2"
                cidr_block        = "10.0.42.0/24"
                availability_zone = "us-east-1b"
            },
            {
                name              = "transport_3"
                cidr_block        = "10.0.43.0/24"
                availability_zone = "us-east-1c"
            },
        ]
    # app_route_table inputs
        app_route_table = [
            {
                name = "app_route_table"
                route = [
                    {
                        gateway_name = "my_igw"
                        cidr_block   = "0.0.0.0/0"
                    }
                ]
            }
        ]
    # app_network_acl inputs
        app_network_acl = [
            {
                name = "app_network_acl"
                ingress = [
                    {
                        protocol    = "tcp" 
                        rule_no     = "100"
                        action      = "allow"
                        cidr_block  = "0.0.0.0/0"
                        from_port   = "0"
                        to_port     = "65535"
                    }
                ]
                egress = [
                    {
                        protocol    = "tcp" 
                        rule_no     = "100"
                        action      = "allow"
                        cidr_block  = "0.0.0.0/0"
                        from_port   = "0"
                        to_port     = "65535"
                    }
                ]
            }
        ]
    # app_seucrity_group inputs
        app_security_group = [
            {
                name        = "app_security_group"
                description = "Security group for the application account"
                egress = [
                    {
                        from_port            = "0"
                        to_port              = "0"
                        protocol             = "-1"
                        cidr_blocks          = ["0.0.0.0/0"]
                        ipv6_cidr_blocks     = ["::/0"]
                    }
                ]
                ingress = [
                    {
                        from_port            = "0"
                        to_port              = "0"
                        protocol             = "-1"
                        cidr_blocks          = ["0.0.0.0/0"]
                        ipv6_cidr_blocks     = ["::/0"]
                    }
                ]

            }
        ]

# analytics environment inputs
    # analytics_vpc inputs
        analytics_vpc = {
            name       = "analytics_vpc"
            cidr_block = "172.0.0.0/16"
        }
    # app_subnets inputs
        analytics_subnet = [
            {
                name              = "ETL_1"
                cidr_block        = "172.0.1.0/24"
                availability_zone = "us-east-1a"
            },
            {
                name              = "ETL_2"
                cidr_block        = "172.0.2.0/24"
                availability_zone = "us-east-1b"
            },
            {
                name              = "ELT_3"
                cidr_block        = "172.0.3.0/24"
                availability_zone = "us-east-1c"
            },
            {
                name              = "transport_1"
                cidr_block        = "172.0.4.0/24"
                availability_zone = "us-east-1a"
            },
            {
                name              = "transport_2"
                cidr_block        = "172.0.5.0/24"
                availability_zone = "us-east-1b"
            },
            {
                name              = "transport_3"
                cidr_block        = "172.0.6.0/24"
                availability_zone = "us-east-1c"
            },
        ]
    # app_route_table inputs
        analytics_route_table = [
            {
                name = "analytics_route_table"
                route = []
            }
        ]
    # analytics_network_acl inputs
        analytics_network_acl = [
            {
                name = "analytics_network_acl"
                ingress = [
                    {
                        protocol    = "tcp" 
                        rule_no     = "100"
                        action      = "allow"
                        cidr_block  = "0.0.0.0/0"
                        from_port   = "0"
                        to_port     = "65535"
                    }
                ]
                egress = [
                    {
                        protocol    = "tcp" 
                        rule_no     = "100"
                        action      = "allow"
                        cidr_block  = "0.0.0.0/0"
                        from_port   = "0"
                        to_port     = "65535"
                    }
                ]
            }
        ]
    # analytics_security_group inputs
        analytics_security_group = [
            {
                name        = "analytics_security_group"
                description = "Security group for the analytics account"
                egress = [
                    {
                        from_port            = "0"
                        to_port              = "0"
                        protocol             = "-1"
                        cidr_blocks          = ["0.0.0.0/0"]
                        ipv6_cidr_blocks     = ["::/0"]
                    }
                ]
                ingress = [
                    {
                        from_port            = "0"
                        to_port              = "0"
                        protocol             = "-1"
                        cidr_blocks          = ["0.0.0.0/0"]
                        ipv6_cidr_blocks     = ["::/0"]
                    }
                ]

            }
        ]