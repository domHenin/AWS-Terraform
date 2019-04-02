#-----root/variables.tf-----

# Variable for Region
variable "aws_region" {}

# Variable for Project Name
variable "project_name" {}

# Variable for VPC Cidr
variable "vpc_cidr" {}

# Variable for Public Cidrs
variable "public_cidrs" {
  type = "list"
}

# Variable for Access IP
variable "access_ip" {}

//TODO:
//variable: aws_region
//variable: project_name
//variable: vpc_cidr
//variable: accessip
//- do not provide values
//
//variable public_cidrs
//  - set type: list
