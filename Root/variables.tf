#-----root/variables.tf-----

# Variable for Region
variable "aws_region" {}

#-----storage/variables

# Variable for Project Name
variable "project_name" {}

#-----networking/variables

# Variable for VPC Cidr
variable "vpc_cidr" {}

# Variable for Public Cidrs
variable "public_cidrs" {
  type = "list"
}

# Variable for Access IP
variable "access_ip" {}

#-----compute/variables

# Variable for Key Name
variable "key_name" {}

# Variable for Public Key Path
variable "public_key_path" {}

# Variable for Server Instance Type
variable "server_instance_type" {}

# Variable for Instance Count
variable "instance_count" {
  default = 1
}

//TODO:
//variable: aws_region
//variable: project_name
//variable: vpc_cidr
//variable: accessip
//- do not provide values
//
//variable public_cidrs
//  - set type: list

