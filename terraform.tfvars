# Tags for common use inputs
    tags = {
        Environment = "production"
        Owner       = "Cloud Admin"
    }

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
        ]
    # app_route_table inputs
        app_route_table = [
            {
                name = "app_route_table"
                route = []
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