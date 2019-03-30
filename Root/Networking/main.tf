#-----networking/main.tf-----

# Create a Data Resource
data "aws_availability_zone" "available_zones" {}

# Create a VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "tf_vpc"
  }
}

//TODO:
//data: available_zone
//  -set no values
//resource: tf_vpc
//  - set cidr to variable(/16)
//  - enable_hostname -> true
//  - enable_support -> true
//  - tags -> tf_vpc