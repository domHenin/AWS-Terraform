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

# Create Internet Gateway
resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  tags {
    Name = "tf_igw"
  }
}

# Create Route Table (public)
resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_internet_gateway.id}"
  }

  tags {
    Name = "tf_public"
  }
}

# Create Route Table (private)
resource "aws_default_route_table" "tf_private_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"

  tags {
    Name = "tf_private"
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
//resource: tf_internet_gateway
//  - set vpc_id -> refrence vpc (automatic)
//  - tags -> tf_igw
//resource: tf_public_rt (route table[public])
//  - set vpc_id -> refrence vpc above
//  - set route -> cidr::0.0.0.0/0, gatewayID::reference internet_gateway
//resource: tf_private_rt
//  - set vpc_id -> refrence vpc (automatic)
//  - set defaultRoutTableId -> reference defaultRouteTableID
//  - tags -> tf_private