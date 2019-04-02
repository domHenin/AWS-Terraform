#-----networking/main.tf-----

# Create a Data Resource
data "aws_availability_zone" "available_zone" {}

# Create a VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = ture

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
    gateway_id = "${aws_internet_gateway.tf_internet_gateway}"
  }

  tags {
    Name = "tf_public"
  }
}

# Create Route Table (private)
resource "aws_route_table" "tf_private_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"

  tags {
    Name = tf_private
  }
}

# Create Subnet
resource "aws_subnet" "tf_public_subnet" {
  count = 2
  vpc_id = "${aws_vpc.tf_vpc.id}"
  cidr_block = "${var.public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_public_${count.index+1}"
  }
}

# Create Route Table Associtation
resource "aws_route_table_association" "tf_public_assoc" {
  count = "${aws_subnet.tf_public_subnet.count}"
  subnet_id = "${aws_subnet.tf_public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}

# Secure Enviroment
resource "aws_security_group" "tf_public_sg" {
  name = "tf_public_sg"
  description = "Used for access to the public instances"
  vpc_id = "${aws_vpc.tf_vpc.id}"

  #SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["{$var.accessip}"]
  }

  #HTTP
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["{var.accessip"]
  }

  #Egress
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

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
//
//resource: tf_internet_gateway
//  - set vpc_id -> refrence vpc (automatic)
//  - tags -> tf_igw
//
//resource: tf_public_rt (route table[public])
//  - set vpc_id -> refrence vpc above
//  - set route -> cidr::0.0.0.0/0, gatewayID::reference internet_gateway
//resource: tf_private_rt
//  - set vpc_id -> refrence vpc (automatic)
//  - set defaultRoutTableId -> reference defaultRouteTableID
//  - tags -> tf_private
//
//reource: tf_public_subnet (subnet)
//  - set count:2 -->
//  - set vpc_id: use variable
//  - set cidr_block: use variable *[count.index]*
//  - set map_ip_on_launch: true
//  - set availability zone: "${data.aws_availability_zones.available.names[count.index]}" *practice*
//  - set tag: "tf_public_${count.index+1}"
//
//resource: tf_public assoc (route table assc)
//  - set count: "${aws_subnet.tf_public_subnet.count}"
//  - set subnet_id: "${aws_subnet.tf_public_subnet.*.id[count.index]}"
//  - set route_table_id: "${aws_route_table.tf_public_rt.id}"
//
//resource: tf_public_sg (security group)
//  - set name:: tf_public_sg
//  - set description:: "Used for access to the public instances"
//  - set vpc_id:: automatice
//  - set SSH:
//    - ingress::
//      - from:22
//      - to:22
//      - protocol: tcp
//      - cidr-block: access-variable
//  - set HTTPL
//    - ingress::
//      - from:80
//      - to:80
//      - protoclo: tcp
//      - cidr-block: access-variable
//  - Egress
//    - from:0
//    - to: 0
//    - protocol:-1
//    - cidr: [0.0.0.0/0]