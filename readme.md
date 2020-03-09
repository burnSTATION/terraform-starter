# Terraform Starter
This repository contains terraform configuration to build the following:
- 1 VPC (10.0.0.0/16)
- 1 Internet Gateway
- 2 Public Subnets [10.0.1.0/24, 10.0.2.0/24]
- 1 NAT Gateway
- 2 Private Subnets [10.0.3.0/24, 10.0.4.0/24]
- 1 Subnet group for RDS instances [10.0.3.0/24, 10.0.4.0/24]