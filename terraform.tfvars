# Global inputs
    # Tags for common use inputs
        tags = {
            Environment = "production"
            Owner       = "Cloud Admin"
        }
    # Internet Gateway inputs
        internet_gateway = [ 
            {
                name     = "app_igw"
                vpc_name = "app_vpc"
            }, 
            {
                name     = "analytics_igw"
                vpc_name = "analytics_vpc"
            }
        ]
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
                cidr_block        = "10.0.0.0/20"
                availability_zone = "us-east-1a"
            },
            {
                name              = "alb_2"
                cidr_block        = "10.0.64.0/20"
                availability_zone = "us-east-1b"
            },
            {
                name              = "alb_3"
                cidr_block        = "10.0.128.0/19"
                availability_zone = "us-east-1c"
            },
            {
                name              = "frontend_1"
                cidr_block        = "10.0.16.0/20"
                availability_zone = "us-east-1a"
            },
            {
                name              = "frontend_2"
                cidr_block        = "10.0.80.0/20"
                availability_zone = "us-east-1b"
            },
            {
                name              = "frontend_3"
                cidr_block        = "10.0.160.0/19"
                availability_zone = "us-east-1c"
            },
            {
                name              = "database_1"
                cidr_block        = "10.0.32.0/20"
                availability_zone = "us-east-1a"
            },
            {
                name              = "database_2"
                cidr_block        = "10.0.96.0/20"
                availability_zone = "us-east-1b"
            },
            {
                name              = "database_3"
                cidr_block        = "10.0.192.0/19"
                availability_zone = "us-east-1c"
            },
            {
                name              = "transport_1"
                cidr_block        = "10.0.48.0/20"
                availability_zone = "us-east-1a"
            },
            {
                name              = "transport_2"
                cidr_block        = "10.0.112.0/20"
                availability_zone = "us-east-1b"
            },
            {
                name              = "transport_3"
                cidr_block        = "10.0.224.0/19"
                availability_zone = "us-east-1c"
            },
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
    # app_route_table inputs
        app_route_table = [
            {
                name        = "alb_route_table"
                route       = []
            },
            {
                name        = "frontend_route_table"
                route       = []
            },
            {
                name        = "database_route_table"
                route       = []
            },
            {
                name        = "transport_route_table"
                route       = []
            },
            {
                name        = "igw_route_table"
                route       = []
            },
        ]
    # app_route_table_association inputs
        app_route_table_association = [
            {
                subnet_unique_name      = "app_alb_1"
                route_table_unique_name = "app_alb_route_table"
            },
            {
                subnet_unique_name      = "app_alb_2"
                route_table_unique_name = "app_alb_route_table"
            },
            {
                subnet_unique_name      = "app_alb_3"
                route_table_unique_name = "app_alb_route_table"
            },
            {
                subnet_unique_name      = "app_frontend_1"
                route_table_unique_name = "app_frontend_route_table"
            },
            {
                subnet_unique_name      = "app_frontend_2"
                route_table_unique_name = "app_frontend_route_table"
            },
            {
                subnet_unique_name      = "app_frontend_3"
                route_table_unique_name = "app_frontend_route_table"
            },
            {
                subnet_unique_name      = "app_database_1"
                route_table_unique_name = "app_database_route_table"
            },
            {
                subnet_unique_name      = "app_database_2"
                route_table_unique_name = "app_database_route_table"
            },
            {
                subnet_unique_name      = "app_database_3"
                route_table_unique_name = "app_database_route_table"
            },
            {
                subnet_unique_name      = "app_transport_1"
                route_table_unique_name = "app_transport_route_table"
            },
            {
                subnet_unique_name      = "app_transport_2"
                route_table_unique_name = "app_transport_route_table"
            },
            {
                subnet_unique_name      = "app_transport_3"
                route_table_unique_name = "app_transport_route_table"
            },
            {
                gateway_name            = "app_igw"
                route_table_unique_name = "app_igw_route_table"
            },
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
    # analytics_subnets inputs
        analytics_subnet = [
            {
                name              = "ETL_1"
                cidr_block        = "172.0.0.0/19"
                availability_zone = "us-east-1a"
            },
            {
                name              = "ETL_2"
                cidr_block        = "172.0.64.0/19"
                availability_zone = "us-east-1b"
            },
            {
                name              = "ETL_3"
                cidr_block        = "172.0.128.0/18"
                availability_zone = "us-east-1c"
            },
            {
                name              = "transport_1"
                cidr_block        = "172.0.32.0/19"
                availability_zone = "us-east-1a"
            },
            {
                name              = "transport_2"
                cidr_block        = "172.0.96.0/19"
                availability_zone = "us-east-1b"
            },
            {
                name              = "transport_3"
                cidr_block        = "172.0.192.0/18"
                availability_zone = "us-east-1c"
            },
        ]
    # analytics_route_table inputs
        analytics_route_table = [
            {
                name = "etl_route_table"
                route = []
            },
            {
                name = "transport_route_table"
                route = []
            },
            {
                name = "igw_route_table"
                route = []
            },
        ]
    # analytics_route_table_association inputs
        analytics_route_table_association = [
            {
                subnet_unique_name      = "analytics_ETL_1"
                route_table_unique_name = "analytics_etl_route_table"
            },
            {
                subnet_unique_name      = "analytics_ETL_2"
                route_table_unique_name = "analytics_etl_route_table"
            },
            {
                subnet_unique_name      = "analytics_ETL_3"
                route_table_unique_name = "analytics_etl_route_table"
            },
            {
                subnet_unique_name      = "analytics_transport_1"
                route_table_unique_name = "analytics_transport_route_table"
            },
            {
                subnet_unique_name      = "analytics_transport_2"
                route_table_unique_name = "analytics_transport_route_table"
            },
            {
                subnet_unique_name      = "analytics_transport_3"
                route_table_unique_name = "analytics_transport_route_table"
            },
            {
                gateway_name            = "analytics_igw"
                route_table_unique_name = "analytics_igw_route_table"
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